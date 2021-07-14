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
//    var item = ClothView(frame: UIScreen.main.bounds)
    let clothView = ClothView()


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = clothView.creatingView(clothData: clothFeatures, heightOfController: (self.navigationController?.navigationBar.frame.height)!)
        clothView.scrollView.delegate = self

    }
    
    @objc func orderButtonPressed() {
        
        let vc = SizeDescriptionViewController()
        vc.sizeData = clothFeatures
        present(vc, animated: true, completion: nil)
        
    }
}

extension ClothViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        clothView.pageControl.currentPage = Int(round(clothView.scrollView.contentOffset.x / clothView.scrollView.frame.size.width))
    }
    
}
