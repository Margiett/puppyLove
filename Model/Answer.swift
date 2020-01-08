//
//  Answer.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct Answer: Decodable {
    let id: String
    let name: String
    let avatar: String
    let questionId: String
    let questionLabName: String
    let questionTitle: String
    let answerDescription: String
    let createdAt: String
}

