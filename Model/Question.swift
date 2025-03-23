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
    var options: [String]  // 선택지 목록
    var answer: String
    var tappedAnswer: String?
    var imageName: String?
    var imageURL: String?
    var underline: [String]  // 문제 본문에서 밑줄을 적용할 단어 목록

    enum CodingKeys: String, CodingKey {
        case id, question, options, answer, tappedAnswer, imageName, imageURL, underline
    }

    init(question: String? = nil, options: [String], answer: String, tappedAnswer: String? = nil, imageName: String? = nil, imageURL: String? = nil, underline: [String] = []) {
        self.question = question
        self.options = options
        self.answer = answer
        self.tappedAnswer = tappedAnswer
        self.imageName = imageName
        self.imageURL = imageURL
        self.underline = underline
    }
}
