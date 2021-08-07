//
//  TestClothView.swift
//  BlackstarWear
//
//  Created by Kirill on 25.07.2021.
//

import UIKit

class TestClothView: UIView {
    

    
    var widthOfScrollView = UIScreen.main.bounds.width
    var heightOfScrollView = UIScreen.main.bounds.height / 3
    var x: Int = 0
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    

    
    lazy var imageCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = true
        collection.register(ClothCellCollectionViewCell.self, forCellWithReuseIdentifier: ClothCellCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    

    func creatingView(clothData: RawItemsModel?, tabBarHeight: CGFloat, navigationHeight:CGFloat, tabBarLow: CGFloat, vc: UIViewController) -> UIView {

        let numbersOfImages: Int = clothData?.productImages.count ?? 0
        let clothView = UIView()
        clothView.backgroundColor = .white
        imageCollection.dataSource = vc as? UICollectionViewDataSource
        imageCollection.delegate = vc as? UICollectionViewDelegate
        
        clothView.addSubview(imageCollection)
        
        
        let mainScrollView: UIScrollView = {
            let scroll = UIScrollView(frame: CGRect(x: 0, y: navigationHeight, width: UIScreen.main.bounds.width, height: tabBarHeight - UIScreen.main.bounds.height * 0.1))
            scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
            scroll.isScrollEnabled = true
            scroll.showsVerticalScrollIndicator = true
            scroll.alwaysBounceVertical = true
            return scroll
        }()
        
        
        
        
        clothView.addSubview(mainScrollView)
        
        clothView.layoutIfNeeded()
        
        let contentView: UIView = {
            let content = UIView(frame: CGRect(x: mainScrollView.frame.origin.x, y: mainScrollView.frame.origin.x, width: mainScrollView.frame.width, height: mainScrollView.contentSize.height))
            return content
        }()
        
        mainScrollView.addSubview(contentView)
        

            
        clothView.addSubview(imageCollection)
        
        NSLayoutConstraint.activate([imageCollection.topAnchor.constraint(equalTo: contentView.topAnchor), imageCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor), imageCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor), imageCollection.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4)])
        

        
        clothView.layoutIfNeeded()

        
  
        pageControl.numberOfPages = numbersOfImages
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        clothView.addSubview(pageControl)
            
        NSLayoutConstraint.activate([pageControl.centerXAnchor.constraint(equalTo: imageCollection.centerXAnchor), pageControl.bottomAnchor.constraint(equalTo: imageCollection.bottomAnchor), pageControl.widthAnchor.constraint(equalTo: imageCollection.widthAnchor, multiplier: 0.4), pageControl.heightAnchor.constraint(equalTo: imageCollection.heightAnchor, multiplier: 0.2)])
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.sizeToFit()
            label.adjustsFontSizeToFitWidth = true
            let price = String((clothData?.price?.dropLast(2))!)
            label.text = price + " руб."
            return label
        }()
        

        let colorLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.sizeToFit()
            label.adjustsFontSizeToFitWidth = true
            label.text = "Цвет: " + (clothData?.colorName)!
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.sizeToFit()
            label.numberOfLines = 0
            label.text = clothData?.description
            label.textAlignment = .center
            return label
        }()
        
        let orderButton: UIButton = {
            let button = UIButton()
            button.setTitle("Заказать", for: .normal)
            button.backgroundColor = .red
            button.tintColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(ClothViewController(), action: #selector(ClothViewController.orderButtonPressed), for: .touchUpInside)
            
            return button
        }()
        
        contentView.addSubview(priceLabel)
        contentView.addSubview(colorLabel)
        contentView.addSubview(descriptionLabel)
        clothView.addSubview(orderButton)
        
        NSLayoutConstraint.activate([priceLabel.topAnchor.constraint(equalTo: imageCollection.bottomAnchor, constant: 10), priceLabel.leftAnchor.constraint(equalTo: clothView.leftAnchor, constant: 5), priceLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([colorLabel.topAnchor.constraint(equalTo: imageCollection.bottomAnchor, constant: 10), colorLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor), colorLabel.rightAnchor.constraint(equalTo: clothView.rightAnchor, constant: -5)])
        
        
        NSLayoutConstraint.activate([descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1), descriptionLabel.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 10)])
        
        clothView.layoutIfNeeded()

        mainScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: descriptionLabel.frame.maxY)
        
        
        NSLayoutConstraint.activate([orderButton.bottomAnchor.constraint(equalTo: clothView.bottomAnchor, constant: -tabBarLow), orderButton.leftAnchor.constraint(equalTo: contentView.leftAnchor), orderButton.rightAnchor.constraint(equalTo: contentView.rightAnchor), orderButton.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 0.08)])

        
        return clothView
    }
    
}
