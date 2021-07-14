//
//  ViewModel.swift
//  BlackstarWear
//
//  Created by Kirill on 27.05.2021.
//

import Foundation
import UIKit

class CategoriesViewModel {
    
    private var rawCategoryList: [Info] = []
    private var categoryList: [CategoryModel] = []
    var subCategoryList: [[SubCategories]] = []
    func modelingDataForViewCategories(completion: @escaping ([CategoryModel?]) -> Void) {
        
        APICall.shared.fetchGenericData(urlString: "https://blackstarshop.ru/index.php?route=api/v1/categories") { [self] (categories: Categories) in
            

                rawCategoryList.append(categories.accessories!)
                rawCategoryList.append(categories.female!)
                rawCategoryList.append(categories.male!)
                rawCategoryList.append(categories.kid!)
                rawCategoryList.append(categories.sales!)
                rawCategoryList.append(categories.new!)
                rawCategoryList.append(categories.marketplace!)
                rawCategoryList.append(categories.preorder!)

            
            for category in rawCategoryList {
                
                // CategoriesViewModel
                var categoryObj = CategoryModel(subcategories: [SubCategories()])
                categoryObj.name = category.name
                let imageUrl = URL(string: "https://blackstarwear.ru/" + category.image!)
                let imageData = try! Data(contentsOf: imageUrl!)
                let image = UIImage(data: imageData)
                categoryObj.image = image
                
                var subCategorList: [SubCategories] = []
                for x in category.subcategories {
                    var eachSubCategorItem = SubCategories()
                    eachSubCategorItem.id = x.id
                    eachSubCategorItem.name = x.name
                    guard let imageUrl = URL(string: "https://blackstarwear.ru/" + x.iconImage!) else {return}
                    let imageData = try! Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    eachSubCategorItem.iconImage = image
                    subCategorList.append(eachSubCategorItem)
                }
                
                categoryObj.subcategories = subCategorList
                categoryList.append(categoryObj)
            }
            
            for subCategoryItems in categoryList {
                var list: [SubCategories] = []
                for item in subCategoryItems.subcategories {
                    list.append(item)
                }
                subCategoryList.append(list)
            }
            
            
            DispatchQueue.main.async {
                completion(categoryList)
            }
            
        }
    }
    
}
