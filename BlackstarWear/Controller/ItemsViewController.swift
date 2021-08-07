//
//  ItemsViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 14.06.2021.
//

import UIKit

class ItemsViewController: UIViewController {
    
    var id: String? = ""
    var itemsList: [ItemsModel] = []
    var rawItemsList: [RawItemsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.collectionViewLayout = layout
        collection.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        view.addSubview(collection)
        settingCollectionConsts(collectionView: collection)
        
        DispatchQueue.main.async {
            self.showSpinner()
        }
        
        let itemsViewModel = ItemsViewModel()
        
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            print("This is run on a background queue")
            itemsViewModel.modelingDataForItemsVC(id: id!) { items, rawItems in
                
                DispatchQueue.main.async {
                    self.itemsList = items
                    self.rawItemsList = rawItems
                    collection.reloadData()
                    self.removeSpiner()
                }
            }
        }
        
    }
        
    
    
    func settingCollectionConsts(collectionView: UICollectionView) {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

    }
    
}




extension ItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.identifier, for: indexPath) as! ItemsCollectionViewCell
        
        if let mainImage = itemsList[indexPath.row].mainImage {
            cell.itemImage.image = mainImage
        }
        cell.priceLabel.text = itemsList[indexPath.row].price
        cell.nameLabel.text = itemsList[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        transitionToClothVC(indexPath: indexPath.row)
    }
    
    
    func transitionToClothVC(indexPath: Int) {
        let clothVC = ClothViewController()
        clothVC.clothFeatures = rawItemsList[indexPath]
        navigationController?.pushViewController(clothVC, animated: true)
    }
    
}


extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: UIScreen.main.bounds.width * 0.07, bottom: 10, right: UIScreen.main.bounds.width * 0.07)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
