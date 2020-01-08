//
//  PostedQuestion.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct PostedQuestion: Encodable {
    // only using this to send data
    let title: String
    let topicName: String
    let description: String
    let createdAt: String // timestamp of the created date of the Question...
}
