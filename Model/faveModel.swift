//
//  faveModel.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let trackId : Int
    let favoritedBy: String
    let name: String
    let dogImage: String
}
