//
//  ItemsCollectionViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 14.06.2021.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(itemImage)
        contentView.addSubview(priceLabel)
        contentView.addSubview(nameLabel)
        settingConsts()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var itemImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var priceLabel: UILabel = {
        let price = UILabel()
        price.numberOfLines = 1
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textColor = .gray
        return price
    }()
    
    var nameLabel: UILabel = {
        let name = UILabel()
        name.numberOfLines = 0
        name.textColor = .black
        name.adjustsFontSizeToFitWidth = true
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    func settingConsts()  {
        NSLayoutConstraint.activate([itemImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7), itemImage.topAnchor.constraint(equalTo: contentView.topAnchor), itemImage.rightAnchor.constraint(equalTo: contentView.rightAnchor), itemImage.leftAnchor.constraint(equalTo: contentView.leftAnchor)])
        
        NSLayoutConstraint.activate([priceLabel.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 0.5), priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0), priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0), priceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.08)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0.5), nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor), nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor), nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor) ])
    }
}
