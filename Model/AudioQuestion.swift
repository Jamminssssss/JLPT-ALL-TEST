//
//  AudioQuestion.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation

struct AudioQuestion {
    let question: String?
    var imageName: String?      // Moved up to be closer to the question
    var imageURL: String?       // Moved up to be closer to the question
    let options: [String]
    let answer: String
    var tappedAnswer: String?
    let audioFileName: String
    
    init(question: String? = nil,
         imageName: String? = nil,
         imageURL: String? = nil,
         options: [String],
         answer: String,
         tappedAnswer: String? = nil,
         audioFileName: String) {
        
        self.question = question
        self.imageName = imageName
        self.imageURL = imageURL
        self.options = options
        self.answer = answer
        self.tappedAnswer = tappedAnswer
        self.audioFileName = audioFileName
    }
}
