//
//  ItemsViewModel.swift
//  BlackstarWear
//
//  Created by Kirill on 14.06.2021.
//

import Foundation
import UIKit

class ItemsViewModel {
    
    func modelingDataForItemsVC(id: String?, completion: @escaping ([ItemsModel],[RawItemsModel]) -> Void) {
        APICall.shared.fetchGenericData(urlString: "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=" + id!) { (items: [String: RawItemsModel]) in
            var itemsList: [ItemsModel] = []
            let keys = items.keys
            let array = keys.map{items[$0]!}
            for item in array {
                var itemModel = ItemsModel()
                itemModel.name = item.name
                if let itemPrice: String = item.price {
                    itemModel.price = String(itemPrice.dropLast(2)) + " руб."
                }
                
                if let imageLink = item.mainImage {
                
                let imageUrl = URL(string: "https://blackstarwear.ru/" + imageLink)
                do {
                    let imageData = try Data(contentsOf: imageUrl!)
                    let image = UIImage(data: imageData)
                    itemModel.mainImage = image
                    itemsList.append(itemModel)
                } catch {
                    print("Error while parsing")
                }
                DispatchQueue.main.async {
                    completion(itemsList,array)
                }
                    
                }
                
            }
        }
    }
    
}
