//
//  Operators.swift
//  BlackstarWear
//
//  Created by Kirill on 18.06.2021.
//

import Foundation
import UIKit

//extension UIView {
//    func stringToImage(address: String) -> UIImage? {
//        let imageUrl = URL(string: "https://blackstarwear.ru/" + address)
//            do {
//                let imageData = try Data(contentsOf: imageUrl!)
//                let image = UIImage(data: imageData)
//                return image
//            } catch {
//                print("Error while parsing")
//            }
//        return nil
//    }
//}
//
//extension UIAccessibility {
//    func stringToImage(address: String) -> UIImage? {
//        let imageUrl = URL(string: "https://blackstarwear.ru/" + address)
//            do {
//                let imageData = try Data(contentsOf: imageUrl!)
//                let image = UIImage(data: imageData)
//                return image
//            } catch {
//                print("Error while parsing")
//            }
//        return nil
//    }
//
//}

public func stringToImage(address: String) -> UIImage? {
    let imageUrl = URL(string: "https://blackstarwear.ru/" + address)
        do {
            let imageData = try Data(contentsOf: imageUrl!)
            let image = UIImage(data: imageData)
            return image
        } catch {
            print("Error while parsing")
        }
    return nil
}

import RealmSwift

extension Results {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}

extension RealmSwift.List {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}
