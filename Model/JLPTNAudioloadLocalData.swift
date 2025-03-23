//
//  JLPTN1AudioloadLocalData.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation

struct JLPTAudioDataLoader {
    
    static func JLPTN1AudioloadLocalData() -> [AudioQuestion] {
        // Return sample data with the correct parameter order
        return [
            AudioQuestion(
                question: "1番",
                options: ["商品を補充する","さくら店に商品を送る","ダイレクトメールの発送の準備をする","店で使用するかざりを作る"],
                answer: "商品を補充する",
                audioFileName: "N1Q1.mp3"
            ),
            AudioQuestion(
                question: "2番",
                options: ["体験者のビデオを見る","先生にすいせんじょうを依頼する","保険の加入手続きをする","指定科目の成績をかくにんする"],
                answer: "指定科目の成績をかくにんする",
                audioFileName: "N1Q2.mp3"
            ),
            AudioQuestion(
                question: "3番",
                options: ["見積もりの合計金額を見直す","見積もり金額の内訳を詳しく書く","バスが確保できたかかくにんする","見積書の有効期限を書く"],
                answer: "見積もり金額の内訳を詳しく書く",
                audioFileName: "N1Q3.mp3"
            )
        ]
    }
}

struct JLPTAudioDataLoader1 {
    static func JLPTN2AudioloadLocalData() -> [AudioQuestion] {
        // Return sample data with the correct parameter order
        return [
            AudioQuestion(
                question: "테스트",
                options: ["商品を補充する","さくら店に商品を送る","ダイレクトメールの発送の準備をする","店で使用するかざりを作る"],
                answer: "商品を補充する",
                audioFileName: "N1Q1.mp3"
            ),
            AudioQuestion(
                question: "2番",
                options: ["体験者のビデオを見る","先生にすいせんじょうを依頼する","保険の加入手続きをする","指定科目の成績をかくにんする"],
                answer: "指定科目の成績をかくにんする",
                audioFileName: "N1Q2.mp3"
            ),
            AudioQuestion(
                question: "3番",
                options: ["見積もりの合計金額を見直す","見積もり金額の内訳を詳しく書く","バスが確保できたかかくにんする","見積書の有効期限を書く"],
                answer: "見積もり金額の内訳を詳しく書く",
                audioFileName: "N1Q3.mp3"
            )
        ]
    }
}
