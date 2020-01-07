//
//  puppyLove.swift
//  puppyLove
//
//  Created by Margiett Gil on 12/31/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation

struct PuppyLoveSearch: Codable {
    let results: [PuppyLove]
}

struct PuppyLove: Codable {
    let name: String
    let number: Int
    let symbol: String
    let source: String
    let atomic_mass: Double
    let melt: Double?
    let boil: Double?
    let discoveredBy: String?
    let id: String?
    let favoritedBy: String?
    
    enum CodingKeys: String, CodingKey {
    case discoveredBy = "discovered_by"
    case melt = "melt"
    case boil = "boil"
    case symbol = "symbol"
    case name = "name"
    case number = "number"
    case id = "id"
    case favoritedBy// = "favorited_by"
    case source = "source"
    case atomic_mass = "atomic_mass"
}
}

