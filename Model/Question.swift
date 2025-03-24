//
//  Question.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/20/25.
//

import Foundation

struct Question: Identifiable, Codable {
    let id = UUID()
    var question: String?
    var imageName: String?      // Moved up to be closer to the question
    var imageURL: String?       // Moved up to be closer to the question
    var options: [String]       // 선택지 목록
    var answer: String
    var tappedAnswer: String?
    var underline: [String]     // 문제 본문에서 밑줄을 적용할 단어 목록

    enum CodingKeys: String, CodingKey {
        case id, question, imageName, imageURL, options, answer, tappedAnswer, underline
    }

    init(question: String? = nil,
         imageName: String? = nil,
         imageURL: String? = nil,
         options: [String],
         answer: String,
         tappedAnswer: String? = nil,
         underline: [String] = []) {
        
        self.question = question
        self.imageName = imageName
        self.imageURL = imageURL
        self.options = options
        self.answer = answer
        self.tappedAnswer = tappedAnswer
        self.underline = underline
    }
}
