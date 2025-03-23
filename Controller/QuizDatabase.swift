import SQLite3
import Foundation

class DatabaseManager {
    // 싱글톤 패턴으로 구현된 공유 인스턴스
    static let shared = DatabaseManager()
    // SQLite 데이터베이스 포인터
    private var db: OpaquePointer?
    
    // 디버깅 모드 설정 (로그 출력 여부 결정)
    var debugMode = true
    
    // 비공개 초기화 메서드
    private init() {
        // 데이터베이스 연결
        openDatabase()
        // 테이블 스키마 업데이트 (필요시)
        updateTableSchema()
        // 테이블 생성 (없을 경우)
        createTable()
        
        // 디버깅: 앱 시작 시 모든 진행 상태 출력
        if debugMode {
            printAllProgress()
        }
    }
    
    // 소멸자: 데이터베이스 연결 종료
    deinit {
        sqlite3_close(db)
    }
    
    // SQLite 데이터베이스 열기
    private func openDatabase() {
        // 앱 문서 디렉토리에 데이터베이스 파일 경로 설정
        let fileURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("quiz_progress.sqlite")
        
        // 데이터베이스 열기 시도
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("❌ SQLite 데이터베이스 열기 실패: \(String(cString: sqlite3_errmsg(db)))")
        } else if debugMode {
            print("✅ SQLite 데이터베이스 열기 성공: \(fileURL.path)")
        }
    }
    
    // 테이블 생성 (없을 경우에만)
    private func createTable() {
        // 레벨과 퀴즈 그룹별로 마지막 문제 인덱스를 저장하는 테이블 생성
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS progress (
            level TEXT,
            quizGroup TEXT,
            lastQuestionIndex INTEGER,
            PRIMARY KEY (level, quizGroup)
        );
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                if debugMode {
                    print("✅ progress 테이블 생성 완료")
                }
            }
        } else {
            print("❌ 테이블 생성 실패: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
    }
    
    // 테이블 스키마 업데이트 (quizGroup 컬럼 추가 - 버전 업그레이드 시 필요)
    private func updateTableSchema() {
        // 테이블 정보 조회
        let checkColumnQuery = "PRAGMA table_info(progress);"
        var statement: OpaquePointer?
        
        // quizGroup 컬럼 존재 여부 확인
        var columnExists = false
        if sqlite3_prepare_v2(db, checkColumnQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let columnName = String(cString: sqlite3_column_text(statement, 1))
                if columnName == "quizGroup" {
                    columnExists = true
                    break
                }
            }
        }
        
        sqlite3_finalize(statement)
        
        // quizGroup 컬럼이 없을 경우에만 추가 (스키마 업데이트)
        if !columnExists {
            let addColumnQuery = "ALTER TABLE progress ADD COLUMN quizGroup TEXT DEFAULT 'default';"
            if sqlite3_prepare_v2(db, addColumnQuery, -1, &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE {
                    if debugMode {
                        print("✅ quizGroup 컬럼 추가 완료")
                    }
                    
                    // 스키마 변경 후 데이터 충돌 방지를 위해 모든 진행 상태 초기화
                    resetAllProgress()
                }
            } else {
                print("❌ quizGroup 컬럼 추가 실패: \(String(cString: sqlite3_errmsg(db)))")
            }
            sqlite3_finalize(statement)
        }
    }
    
    // 특정 레벨과 퀴즈 그룹의 진행 상태 저장
    func saveProgress(level: String, quizGroup: String, index: Int) {
        if debugMode {
            print("📝 저장 요청: 레벨=\(level), 그룹=\(quizGroup), 인덱스=\(index)")
        }
        
        // 트랜잭션 시작 (데이터 일관성 보장)
        sqlite3_exec(db, "BEGIN TRANSACTION", nil, nil, nil)
        
        // 기존 데이터 업데이트 시도
        let updateQuery = "UPDATE progress SET lastQuestionIndex = ? WHERE level = ? AND quizGroup = ?;"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, updateQuery, -1, &statement, nil) == SQLITE_OK {
            // 매개변수 바인딩
            sqlite3_bind_int(statement, 1, Int32(index))
            sqlite3_bind_text(statement, 2, (level as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (quizGroup as NSString).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                if debugMode {
                    print("✅ 진행 상태 업데이트 시도: \(index)")
                }
            } else {
                print("❌ 진행 상태 업데이트 실패: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("❌ 진행 상태 업데이트 쿼리 준비 실패: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
        
        // 업데이트된 행이 없으면 새 데이터 삽입 (UPSERT 패턴)
        if sqlite3_changes(db) == 0 {
            insertProgress(level: level, quizGroup: quizGroup, index: index)
        }
        
        // 트랜잭션 커밋
        sqlite3_exec(db, "COMMIT", nil, nil, nil)
        
        // 디버깅: 저장 후 모든 진행 상태 출력
        if debugMode {
            printAllProgress()
        }
    }
    
    // 새로운 레벨과 퀴즈 그룹의 진행 상태 삽입 (처음 저장 시)
    private func insertProgress(level: String, quizGroup: String, index: Int) {
        let insertQuery = "INSERT INTO progress (level, quizGroup, lastQuestionIndex) VALUES (?, ?, ?);"
        var statement: OpaquePointer?
        
        // 쿼리 준비 및 실행
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            // 매개변수 바인딩
            sqlite3_bind_text(statement, 1, (level as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (quizGroup as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 3, Int32(index))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                if debugMode {
                    print("✅ 진행 상태 초기 저장 완료: \(index) for \(level)/\(quizGroup)")
                }
            } else {
                print("❌ 진행 상태 초기 저장 실패: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("❌ 진행 상태 초기 저장 쿼리 준비 실패: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
    }
    
    // 특정 레벨과 퀴즈 그룹의 진행 상태 불러오기
    func loadProgress(level: String, quizGroup: String) -> Int {
        if debugMode {
            print("🔍 조회 요청: 레벨=\(level), 그룹=\(quizGroup)")
        }
        
        // 특정 레벨과 그룹의 마지막 문제 인덱스 조회
        let selectQuery = "SELECT lastQuestionIndex FROM progress WHERE level = ? AND quizGroup = ?;"
        var statement: OpaquePointer?
        var lastIndex: Int = 0 // 기본값 0
        
        // 쿼리 준비 및 실행
        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            // 매개변수 바인딩
            sqlite3_bind_text(statement, 1, (level as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (quizGroup as NSString).utf8String, -1, nil)
            
            // 결과 조회
            if sqlite3_step(statement) == SQLITE_ROW {
                lastIndex = Int(sqlite3_column_int(statement, 0))
                if debugMode {
                    print("✅ 진행 상태 로드 성공: \(lastIndex) for \(level)/\(quizGroup)")
                }
            } else {
                if debugMode {
                    print("ℹ️ [\(level), \(quizGroup)] 저장된 진행 데이터 없음 (기본값 0 반환)")
                }
            }
        } else {
            print("❌ [\(level), \(quizGroup)] 진행 상태 불러오기 쿼리 준비 실패: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(statement)
        
        return lastIndex
    }
    
    // 디버깅: 모든 진행 상태 출력 (디버깅 및 문제 해결용)
    func printAllProgress() {
        let selectQuery = "SELECT level, quizGroup, lastQuestionIndex FROM progress;"
        var statement: OpaquePointer?
        
        print("📊 현재 저장된 모든 진행 상태:")
        
        // 모든 진행 상태 조회 및 출력
        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let level = String(cString: sqlite3_column_text(statement, 0))
                let quizGroup = String(cString: sqlite3_column_text(statement, 1))
                let index = Int(sqlite3_column_int(statement, 2))
                
                print("   - 레벨: \(level), 그룹: \(quizGroup), 인덱스: \(index)")
            }
        } else {
            print("❌ 진행 상태 조회 실패: \(String(cString: sqlite3_errmsg(db)))")
        }
        
        sqlite3_finalize(statement)
    }
    
    // 모든 진행 상태 초기화 (문제 해결을 위한 전체 데이터 리셋)
    func resetAllProgress() {
        let deleteQuery = "DELETE FROM progress;"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, deleteQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("🧹 모든 진행 상태 초기화 완료")
            } else {
                print("❌ 진행 상태 초기화 실패: \(String(cString: sqlite3_errmsg(db)))")
            }
        }
        
        sqlite3_finalize(statement)
    }
    
    // 특정 레벨과 그룹의 진행 상태만 초기화 (레벨 재시작 등에 활용)
    func resetProgress(level: String, quizGroup: String) {
        let deleteQuery = "DELETE FROM progress WHERE level = ? AND quizGroup = ?;"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, deleteQuery, -1, &statement, nil) == SQLITE_OK {
            // 매개변수 바인딩
            sqlite3_bind_text(statement, 1, (level as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (quizGroup as NSString).utf8String, -1, nil)
            
            // 특정 레벨과 그룹 데이터 삭제
            if sqlite3_step(statement) == SQLITE_DONE {
                print("🧹 레벨 \(level), 그룹 \(quizGroup)의 진행 상태 초기화 완료")
            } else {
                print("❌ 진행 상태 초기화 실패: \(String(cString: sqlite3_errmsg(db)))")
            }
        }
        
        sqlite3_finalize(statement)
    }
}
