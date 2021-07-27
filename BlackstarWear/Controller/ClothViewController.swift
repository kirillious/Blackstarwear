//
//  ClothViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 17.06.2021.
//

import UIKit

class ClothViewController: UIViewController {
    
    var clothFeatures: RawItemsModel?
    static var shared = ClothViewController()
    let testClothView = TestClothView()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let tabBarHeight = self.navigationController?.tabBarController?.tabBar.frame.origin.y
        let navigationHeight = self.navigationController?.navigationBar.frame.maxY
        let tabBarLow = self.navigationController?.tabBarController?.tabBar.frame.height
        self.view = testClothView.creatingView(clothData: clothFeatures,tabBarHeight: (tabBarController?.tabBar.frame.origin.y)! - (tabBarController?.tabBar.frame.height)!, navigationHeight: navigationHeight!, tabBarLow: tabBarLow!)
        testClothView.imageScrollView.delegate = self
    }
    
    @objc func orderButtonPressed() {
        
        let vc = SizeDescriptionViewController()
        vc.sizeData = clothFeatures
        present(vc, animated: true, completion: nil)
        
    }
}

extension ClothViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        testClothView.pageControl.currentPage = Int(round(testClothView.imageScrollView.contentOffset.x / testClothView.imageScrollView.frame.size.width))
        
    }
    
}
