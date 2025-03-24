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
