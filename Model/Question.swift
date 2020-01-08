//
//  Question.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
// when we need to get data in we do decodable
struct Question: Decodable {
    
    let id: String
   let createdAt: String // creating a date stamp
    let name: String // random user name
    let avatar: String // random juser avatar
    let title: String
    let description: String
    let topicName: String
}

