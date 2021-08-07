//
//  ViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 25.05.2021.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categoriesList: [CategoryModel?] = []
    var categoryViewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        self.title = "Catalog"
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        DispatchQueue.main.async {
            self.showSpinner()
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            print("This is run on a background queue")
            self.categoryViewModel.modelingDataForViewCategories { [self] (categories) in
                
                DispatchQueue.main.async {
                    self.categoriesList = categories
                    self.tableView.reloadData()
                    self.removeSpiner()
                }
            }
        }

        view.addSubview(tableView)
        settingConsts()
    }
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    func settingConsts() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}



extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoriesTableViewCell

            cell.categoryName.text = categoriesList[indexPath.row]?.name
            cell.categoryImage.image = categoriesList[indexPath.row]?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transitionToSubCategoriesVC(indexPath: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func transitionToSubCategoriesVC(indexPath: Int) {
        let subCategVC = SubCategoriesViewController()
        var trueItem: [SubCategories] = []
        
        if let trueItem = categoriesList[indexPath]?.subcategories {
            
            var i = 0
            while i < trueItem.count {
                if trueItem[i].iconImage != nil {
                    subCategVC.itemsList.append(trueItem[i])
                }
                i += 1
            }
        }
        
        subCategVC.title = categoriesList[indexPath]?.name
        navigationController?.pushViewController(subCategVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.15
    }

}


