//
//  SubCategoriesViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 08.06.2021.
//

import UIKit

class SubCategoriesViewController: UIViewController {
    
    var itemsList: [SubCategories] = []
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(SubCategoriesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        settingTableConsts()
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

extension SubCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubCategoriesTableViewCell
        cell.categoryName.text = itemsList[indexPath.row].name
        cell.categoryImage.image = itemsList[indexPath.row].iconImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transitionToItemsVC(indexPath: indexPath.row)
    }
    
    func transitionToItemsVC(indexPath: Int) {
        let itemVC = ItemsViewController()
        itemVC.id = itemsList[indexPath].id
        navigationController?.pushViewController(itemVC, animated: true)
    }
    
}
