//
//  TableViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 27.05.2021.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
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
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            categoryImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            categoryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            categoryImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            
        ])
    
    }
    



}
