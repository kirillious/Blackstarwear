//
//  CartTableViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 01.07.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productLabel)
        contentView.addSubview(sizeLabel)
        contentView.addSubview(colorLabel)
        contentView.addSubview(priceLabel)
        setConsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var productImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
       return image
    }()
    
    var productLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 0
       return label
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var colorLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setConsts() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2), productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2), productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3), productImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
                                     
            productLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.2), productLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),  productLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            productLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
        
            sizeLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 2), sizeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),  sizeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
        
            colorLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 2), colorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),  colorLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            
            priceLabel.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 2), priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5), priceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2)
        ])
    }

}
