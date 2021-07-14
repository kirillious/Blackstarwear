//
//  SizeDescriptionTableViewCell.swift
//  BlackstarWear
//
//  Created by Kirill on 27.06.2021.
//

import UIKit

class SizeDescriptionTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sizeLabel)
        addSubview(stockLabel)
        addSubview(addButton)
        settingConst()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sizeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    let stockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        
        return button
    }()
    
    func settingConst() {
        NSLayoutConstraint.activate([sizeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor), stockLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),  addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     
           sizeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9), stockLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),  addButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier:  0.9),
        
            sizeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
            sizeLabel.rightAnchor.constraint(equalTo: stockLabel.leftAnchor, constant: -2),
            stockLabel.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: 2),
            addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2),

        

            stockLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            addButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3)])
    }
    
    
}
