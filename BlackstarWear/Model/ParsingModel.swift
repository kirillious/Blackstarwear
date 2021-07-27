//
//  Model.swift
//  BlackstarWear
//
//  Created by Kirill on 27.05.2021.
//

import Foundation

class Categories: Codable {
    var lastSize: Info?
    var accessories: Info?
    var female: Info?
    var male: Info?
    var kid: Info?
    var collection: Info?
    var sales: Info?
    var new: Info?
    var marketplace: Info?
    var preorder: Info?
    var seasonalBoom: Info?
    
     enum CodingKeys:String, CodingKey, CaseIterable {
        case lastSize = "263"
        case accessories = "67"
        case female = "68"
        case male = "69"
        case kid = "73"
        case collection = "74"
        case sales = "156"
        case new = "165"
        case marketplace = "233"
        case preorder = "0"
        case seasonalBoom = "347"
    }
}

class Info: Codable {
    var name: String?
    var image: String?
    var subcategories: [Items]
}

class Items: Codable {
    var id: String?
    var iconImage: String?
    var name: String?
    
    init(id: String? = nil, iconImage: String? = nil, name: String? = nil) {
        self.id = id
        self.iconImage = iconImage
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        iconImage = try container.decode(String.self, forKey: .iconImage)
        name = try container.decode(String.self, forKey: .name)
        do {
            id = try String(container.decode(Int.self, forKey: .id))
        } catch DecodingError.typeMismatch {
            id = try container.decode(String.self, forKey: .id)
        }
    }
}
