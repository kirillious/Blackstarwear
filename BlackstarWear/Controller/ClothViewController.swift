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
    var convertedImages: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let stringImage = clothFeatures?.productImages {
            for item in stringImage {
                if let image = item?.imageURL {
                    if let readyToUseImg = stringToImage(address: image) {
                        convertedImages.append(readyToUseImg)
                    }
                }
            }
        }
        
        testClothView.imageCollection.reloadData()
        
    }
    
    override func loadView() {
        let navigationHeight = self.navigationController?.navigationBar.frame.maxY
        let tabBarLow = self.navigationController?.tabBarController?.tabBar.frame.height
        self.view = testClothView.creatingView(clothData: clothFeatures,tabBarHeight: (tabBarController?.tabBar.frame.origin.y)! - (tabBarController?.tabBar.frame.height)!, navigationHeight: navigationHeight!, tabBarLow: tabBarLow!, vc: self)
    }
    
    @objc func orderButtonPressed() {
        
        let vc = SizeDescriptionViewController()
        vc.sizeData = clothFeatures
        present(vc, animated: true, completion: nil)
        
    }
}

extension ClothViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        testClothView.pageControl.currentPage = Int(round(testClothView.imageCollection.contentOffset.x / testClothView.imageCollection.frame.size.width))
        
    }
    
}

extension ClothViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return convertedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothCellCollectionViewCell.identifier, for: indexPath) as! ClothCellCollectionViewCell
        
        cell.imageView.image = convertedImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ClothViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}
