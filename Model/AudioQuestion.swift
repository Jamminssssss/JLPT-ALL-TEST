//
//  AudioQuestion.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/21/25.
//

import Foundation

struct AudioQuestion {
    let question: String?        // Question comes first
    var imageName: String?       // Moved up to be closer to the question
    var imageURL: String?        // Moved up to be closer to the question
    let options: [String]        // Options after images
    let answer: String           // Answer after options
    var tappedAnswer: String?    // Tapped answer, for tracking user input
    let audioFileName: String    // Audio file name at the end

    enum CodingKeys: String, CodingKey {
        case id, question, imageName, imageURL, options, answer, tappedAnswer, audioFileName
    }
    
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
