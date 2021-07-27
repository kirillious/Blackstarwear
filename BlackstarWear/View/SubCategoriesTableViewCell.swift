//
//  SubCategoriesTableViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 08.06.2021.
//

import UIKit

class SubCategoriesTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryName)
        contentView.addSubview(categoryImage)
        setContentViewElem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var categoryName: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var categoryImage: UIImageView = {
       var image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    func setContentViewElem() {
        NSLayoutConstraint.activate([categoryName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), categoryName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            categoryImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            categoryImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            
        ])
    
    }
    
    

}
