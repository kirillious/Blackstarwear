//
//  TabBarView.swift
//  BlackstarWear
//
//  Created by Kirill on 28.05.2021.
//

import Foundation
import UIKit

class TabBarView: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let categoriesVC = UINavigationController(rootViewController: CategoriesViewController())
        let typesIcon = UITabBarItem(title: nil, image: UIImage(systemName: "eyes"), selectedImage: UIImage(systemName: "eyes"))
        categoriesVC.tabBarItem = typesIcon
        
        
        let cartVC = CartViewController()
        let cartIcon = UITabBarItem(title: nil, image: UIImage(systemName: "cart"), selectedImage: UIImage(named: "cart"))

        cartVC.tabBarItem = cartIcon

        let controllers = [categoriesVC, cartVC]
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    
}


