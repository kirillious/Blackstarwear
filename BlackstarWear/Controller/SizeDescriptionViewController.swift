//
//  SizeDescriptionViewController.swift
//  BlackstarWear
//
//  Created by Kirill on 26.06.2021.
//

import UIKit



class SizeDescriptionViewController: UIViewController {
    
    var sizeData: RawItemsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SizeDescriptionTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        settingTableConsts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    
    override func viewDidLayoutSubviews() {

        let window = UIApplication.shared.keyWindow
        let bottomPadding = window?.safeAreaInsets.bottom
        view.frame.origin.y = view.frame.height / 3
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = false
        return table
    }()
    
    func settingTableConsts() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    @objc func buttonPressed(sender: UIButton) {
        
        let cartModel1 = PersistantItems()
        cartModel1.price = String((sizeData?.price?.dropLast(3))!)
        cartModel1.colorName = (sizeData?.colorName)!
        cartModel1.productName = (sizeData?.name)!
        cartModel1.size = (sizeData?.offers[sender.tag]?.size)!
        let image = stringToImage(address: (sizeData?.mainImage)!)
        let jpegRepresentation = image?.jpegData(compressionQuality: 1.0)
        Persistance.shared.savingProduct(product: cartModel1)
        
        let date = Date()
        Persistance.shared.savingImages(jpegRepresentation! as NSData, fileName: date)

        sender.backgroundColor = UIColor(red: 0.35, green: 0.0, blue: 0.0, alpha: 1.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.backgroundColor = .red
        }
    }
    
    
}


extension SizeDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sizeData?.offers.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SizeDescriptionTableViewCell
        
        cell.contentView.isUserInteractionEnabled = false
        cell.sizeLabel.text = sizeData?.offers[indexPath.row]?.size
        
        if sizeData?.offers[indexPath.row]?.quantity == "0" {
            cell.stockLabel.text = "Нет в наличии"
        }
        cell.addButton.isEnabled = true
        cell.addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        cell.stockLabel.text = "В наличии " + (sizeData?.offers[indexPath.row]?.quantity)!
        cell.addButton.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Выберите размер"
    }


}

