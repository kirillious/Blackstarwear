//
//  ClothView.swift
//  BlackstarWear
//
//  Created by Kirill on 18.06.2021.
//

import UIKit

class ClothView: UIView {
    
    
    var widthOfScrollView = UIScreen.main.bounds.width
    var heightOfScrollView = UIScreen.main.bounds.height / 3
    var x: Int = 0
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatingView(clothData: RawItemsModel?, heightOfController: CGFloat) -> UIView {
        
        let clothView = UIView(frame: UIScreen.main.bounds)
        clothView.backgroundColor = .white
        
        
        let numbersOfImages: Int = (clothData?.productImages.count)!
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        
        
        scrollView.frame = CGRect(x: 0, y: topPadding + heightOfController, width: clothView.frame.width, height:clothView.frame.height / 2)
        scrollView.backgroundColor = .white
        scrollView.alwaysBounceHorizontal = true
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.superview?.bringSubviewToFront(scrollView)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(numbersOfImages), height: scrollView.frame.height)
        clothView.addSubview(scrollView)
        
        var i = 0
        var viewForImages = UIView(frame: .zero)
        viewForImages = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width * CGFloat(numbersOfImages), height: scrollView.frame.height))
        viewForImages.backgroundColor = .green
        for image in clothData!.productImages {
            
            let picture = UIImageView(frame: CGRect(x: scrollView.frame.origin.x + (scrollView.frame.width * CGFloat(i)), y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
            picture.image = stringToImage(address: (image?.imageURL)!)
            viewForImages.addSubview(picture)
            i += 1
        }
        scrollView.addSubview(viewForImages)
        

        pageControl.numberOfPages = numbersOfImages
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        clothView.addSubview(pageControl)
        
        
        NSLayoutConstraint.activate([pageControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor), pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), pageControl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4), pageControl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.2)])
        
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
            return label
        }()
        
        let textScrollView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.isScrollEnabled = true
            return scroll
        }()
        
        let contentView: UIView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
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
        
        clothView.addSubview(priceLabel)
        clothView.addSubview(colorLabel)
        clothView.addSubview(textScrollView)
        textScrollView.addSubview(contentView)
        contentView.addSubview(descriptionLabel)
        clothView.addSubview(orderButton)
        
        NSLayoutConstraint.activate([priceLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10), priceLabel.leftAnchor.constraint(equalTo: clothView.leftAnchor, constant: 5), priceLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([colorLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10), colorLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 5), colorLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor), colorLabel.rightAnchor.constraint(equalTo: clothView.rightAnchor, constant: -5)])
        
        NSLayoutConstraint.activate([textScrollView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5), textScrollView.leftAnchor.constraint(equalTo: clothView.leftAnchor), textScrollView.rightAnchor.constraint(equalTo: clothView.rightAnchor), textScrollView.bottomAnchor.constraint(equalTo: clothView.safeAreaLayoutGuide.bottomAnchor, constant: -50)])
        
        NSLayoutConstraint.activate([contentView.centerXAnchor.constraint(equalTo: textScrollView.centerXAnchor), contentView.widthAnchor.constraint(equalTo: textScrollView.widthAnchor), contentView.bottomAnchor.constraint(equalTo: textScrollView.bottomAnchor), contentView.topAnchor.constraint(equalTo: textScrollView.topAnchor)])

        
        NSLayoutConstraint.activate([descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9), descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), descriptionLabel.topAnchor.constraint(equalTo: textScrollView.topAnchor)])
        
        NSLayoutConstraint.activate([orderButton.bottomAnchor.constraint(equalTo: clothView.safeAreaLayoutGuide.bottomAnchor, constant: -5), orderButton.leftAnchor.constraint(equalTo: clothView.leftAnchor, constant: 5), orderButton.rightAnchor.constraint(equalTo: clothView.rightAnchor, constant: -5), orderButton.heightAnchor.constraint(equalToConstant: 40)])
        
        clothView.layoutIfNeeded()
        textScrollView.contentSize = CGSize(width: clothView.frame.width, height: descriptionLabel.frame.height)

        
        return clothView
    }
    
}


