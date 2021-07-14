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
        self.title = "Catalog"
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        settingTableConsts()
        

        
        categoryViewModel.modelingDataForViewCategories { (categories) in
            self.categoriesList = categories
            self.tableView.reloadData()
        }        
    }
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func settingTableConsts() {
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
    }
    
    func transitionToSubCategoriesVC(indexPath: Int) {
        let subCategVC = SubCategoriesViewController()
        subCategVC.itemsList = categoryViewModel.subCategoryList[indexPath]
        subCategVC.title = categoriesList[indexPath]?.name
        navigationController?.pushViewController(subCategVC, animated: true)
    }

}


