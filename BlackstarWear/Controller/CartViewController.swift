//
//  CartViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 28.05.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    var tableData = Persistance.shared.realm.objects(PersistantItems.self)
    var sizeDescriptionVC = SizeDescriptionViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(orderButton)
        view.addSubview(tableView)
        setConsts()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = false
        return table
    }()
    
    let orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Оформить заказ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    func setConsts() {
        
        NSLayoutConstraint.activate([orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -2), orderButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2), orderButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -2),
                                     
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.leftAnchor.constraint(equalTo: view.leftAnchor), tableView.rightAnchor.constraint(equalTo: view.rightAnchor), tableView.bottomAnchor.constraint(equalTo: orderButton.topAnchor)])
    }
    
    
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        
        cell.productLabel.text = tableData[indexPath.row].productName
        cell.sizeLabel.text = "Размер " +  tableData[indexPath.row].size
        cell.colorLabel.text = "Цвет " + tableData[indexPath.row].colorName
        let imageURL = Persistance.shared.gettingURLS()![indexPath.row]
        cell.productImage.image = UIImage(contentsOfFile: imageURL.path)
        cell.priceLabel.text = tableData[indexPath.row].price + "руб."
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.25
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        var x: Double = 0.0
        for item in tableData {
            let y = Double(item.price)
            x += y!
        }
        return "Вся стоимость \(x) рублей"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Persistance.shared.deletingProduct(index: indexPath.row)
            Persistance.shared.deletingFileAt(Persistance.shared.gettingURLS()![indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    
}

