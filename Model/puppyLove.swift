//
//  puppyLove.swift
//  puppyLove
//
//  Created by Margiett Gil on 12/31/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

struct PuppyLoveSearch: Codable {
    let results: [PuppyLove]
}

struct PuppyLove: Codable {
    var name: String?
    let dogImage: [Image]
    let breed: String
    let details: [Details?]
    let location: [Location]
    let education: String
    let highlight: String
    let summary: String
    let favoritedBy: String?
}
struct Image: Codable {
        let image: String
    }

struct Details: Codable {
    let furColor: String?
    let eyeColor: String?
    let weight: String?
    let health: String?
    let friendly: String?
    let familyDog: String?
    let dogFriendly: String?
    let furTexture: String?
    let age: String?
    let size: String?
    let sheds: String?
    let sex: String?
}

struct Location: Codable {
    let address: String
    let lat: String
    let lon: String
}

