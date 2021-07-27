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

//extension Results {
//
//    func toArray() -> [Element] {
//        return self.map{$0}
//    }
//}
//
//extension RealmSwift.List {
//
//    func toArray() -> [Element] {
//        return self.map{$0}
//    }
//}

fileprivate var aView: UIView?

extension UIViewController {
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView!.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = .black
        ai.center = view.center
        ai.startAnimating()
        aView!.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func removeSpiner()  {
        aView?.removeFromSuperview()
        aView = nil
    }
}
