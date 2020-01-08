//
//  PostedAnswer.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
//Encodable converts Swift models to Data
struct PostedAnswer: Encodable {
    let questionTitle: String
    let questionId: String // for searching all answers to a question
    let questionLabName: String
    let answerDescription: String
    let createdAt: String // timestamp of the created date of the Question
}
