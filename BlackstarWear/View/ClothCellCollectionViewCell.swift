//
//  ClothCellCollectionViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 07.08.2021.
//

import UIKit

class ClothCellCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: contentView.topAnchor), imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor)])

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
}
