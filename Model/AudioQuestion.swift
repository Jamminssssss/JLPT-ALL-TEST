//
//  AudioQuestion.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation

struct AudioQuestion {
    let question: String?
    let options: [String]
    let answer: String
    var tappedAnswer: String?
    let audioFileName: String
    
    init(question: String? = nil,
         options: [String],
         answer: String,
         tappedAnswer: String? = nil,
         audioFileName: String) {
        
        self.question = question
        self.options = options
        self.answer = answer
        self.tappedAnswer = tappedAnswer
        self.audioFileName = audioFileName
    }
}
