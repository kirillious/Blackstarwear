//
//  CategoryModel.swift
//  BlackstarWear
//
//  Created by Kirill on 08.06.2021.
//

import Foundation
import UIKit

struct CategoryModel {
    var name: String?
    var image: UIImage?
    var subcategories: [SubCategories]
}

struct SubCategories {
    var id: String?
    var iconImage: UIImage?
    var name: String?
}
