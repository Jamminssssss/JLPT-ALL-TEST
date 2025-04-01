//
//  JLPTN1AudioloadLocalData.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation

struct JLPTAudioDataLoader {
    
    static func JLPTN1AudioloadLocalData() -> [AudioQuestion] {
        return [
            AudioQuestion(
                question: "1番",
                options: ["商品を補充する","さくら店に商品を送る","ダイレクトメールの発送の準備をする","店で使用するかざりを作る"],
                answer: "商品を補充する",
                audioFileName: "n1q1.mp3"
            ),
            AudioQuestion(
                question: "2番",
                options: ["体験者のビデオを見る","先生にすいせんじょうを依頼する","保険の加入手続きをする","指定科目の成績をかくにんする"],
                answer: "指定科目の成績をかくにんする",
                audioFileName: "n1q2.mp3"
            ),
            AudioQuestion(
                question: "3番",
                options: ["見積もりの合計金額を見直す","見積もり金額の内訳を詳しく書く","バスが確保できたかかくにんする","見積書の有効期限を書く"],
                answer: "見積もり金額の内訳を詳しく書く",
                audioFileName: "n1q3.mp3"
            ),
            AudioQuestion(
                question: "4番",
                options: ["企画書を修正する","出張の資料を作成する","店の予約をキャンセルする","会食に使う店を探す"],
                answer: "企画書を修正する",
                audioFileName: "n1q4.mp3"
            ),
            AudioQuestion(
                question: "5番",
                options: ["研修期間を長くする","店の経営理念を伝える","時給を上げる","業務のしゅうじゅくどを評価する"],
                answer: "店の経営理念を伝える",
                audioFileName: "n1q5.mp3"
            ),
            AudioQuestion(
                question: "6番",
                options: ["投書らんを設ける","政策関連の記事に図を用いる","イベント情報の記事を増やす","子育て関連の記事を増やす"],
                answer: "政策関連の記事に図を用いる",
                audioFileName: "n1q6.mp3"
            ),
        ]
    }
}

struct JLPTAudioDataLoader1 {
    static func JLPTN2AudioloadLocalData() -> [AudioQuestion] {
        return [
            AudioQuestion(
                question: "1番",
                options: ["先週の会議の記録を作成する","調査結果を入力する","林さんに電話をする","プレゼンのしりょうを作成する"],
                answer: "先週の会議の記録を作成する",
                audioFileName: "n2q1.mp3"
            ),
            AudioQuestion(
                question: "2番",
                options: ["2000円","1000円","900円","100円"],
                answer: "1000円",
                audioFileName: "n2q2.mp3"
            ),
            AudioQuestion(
                question: "3番",
                options: ["ちゅうりんじょうで張り紙を見る","大学でしんせいしょのじゅんびをする","市役所にしんせいしょを取りに行く","市役所でがくせいしょうをコピーする"],
                answer: "大学でしんせいしょのじゅんびをする",
                audioFileName: "n2q3.mp3"
            ),
            AudioQuestion(
                question: "4番",
                options: ["インターネットで店をさがす","木村さんに道具を借りる","アウトドア用品の店で道具を買う","初心者向けのこうざに参加する"],
                answer: "初心者向けのこうざに参加する",
                audioFileName: "n2q4.mp3"
            ),
            AudioQuestion(
                question: "5番",
                options: ["工場の かんりのじょうきょうを 調べる","けいやくのうかに じょうきょうを聞く","運送会社にじょうきょうを聞く","そうこの ほぞんじょうきょうを 調べる"],
                answer: "運送会社にじょうきょうを聞く",
                audioFileName: "n2q5.mp3"
            ),
        ]
    }
}

struct JLPTAudioDataLoader2 {
    static func JLPTN3AudioloadLocalData() -> [AudioQuestion] {
        return [
            AudioQuestion(
                question: "1ばん",
                imageName: "JlptListeningImgae1.png",
                options: ["アウ","アエ","イウ","イエ"],
                answer: "アエ",
                audioFileName: "n3q1.mp3"
            ),
            AudioQuestion(
                question: "2ばん",
                options: ["水曜日","木曜日","金曜日","土曜日"],
                answer: "金曜日",
                audioFileName: "n3q2.mp3"
            ),
            AudioQuestion(
                question: "3ばん",
                options: ["さんかしゃを かくにんする","店に電話する","メールをかくにんする","ないようを決める"],
                answer: "さんかしゃを かくにんする",
                audioFileName: "n3q3.mp3"
            ),
            AudioQuestion(
                question: "4ばん",
                options: ["セミナーにもうしこむ","テストをうける","けいじばんを見る","さんかひをふりこむ"],
                answer: "テストをうける",
                audioFileName: "n3q4.mp3"
            ),
            AudioQuestion(
                question: "5ばん",
                options: ["ちょうさけっかを入力する","サンプルをしてんに送る","かいぎのじゅんびをする","大野さんに仕事をたのむ"],
                answer: "ちょうさけっかを入力する",
                audioFileName: "n3q5.mp3"
            ),
        ]
    }
}

