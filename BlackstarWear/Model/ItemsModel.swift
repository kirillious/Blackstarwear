//
//  ItemsModel.swift
//  BlackstarWear
//
//  Created by Kirill on 14.06.2021.
//

import Foundation
import UIKit

struct RawItemsModel: Codable  {
    var name: String?
    var price: String?
    var mainImage: String?
    var description: String?
    var colorName: String?
    var productImages: [Pictures?]
    var offers: [Offers?]
    
}

struct Pictures: Codable {
    var imageURL: String?
    var sortOrder: String?
}

struct Offers: Codable {
    var size: String?
    var quantity: String?
}


struct ItemsModel {
    var name: String?
    var price: String?
    var mainImage: UIImage?
}
