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
        tableView.tableFooterView = UIView()

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
        
        if let price = sizeData?.price, let colorName = sizeData?.colorName, let productName = sizeData?.name, let size = sizeData?.offers[sender.tag]?.size, let imageString = sizeData?.mainImage {
            
            let cartModel1 = PersistantItems()
            cartModel1.price = String(price.dropLast(3))
            cartModel1.colorName = colorName
            cartModel1.productName = productName
            cartModel1.size = size
            guard let image = stringToImage(address: imageString) else {return}
            guard let jpegRepresentation = image.jpegData(compressionQuality: 1.0) else {return}
            let date = Date()
            Persistance.shared.savingImages(jpegRepresentation as NSData, fileName: date)
            Persistance.shared.savingProduct(product: cartModel1)
        }

        dismiss(animated: true, completion: nil)
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
            cell.stockLabel.text = "?????? ?? ??????????????"
        }
        cell.addButton.isEnabled = true
        cell.addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        cell.stockLabel.text = "?? ?????????????? " + (sizeData?.offers[indexPath.row]?.quantity)!
        cell.addButton.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "???????????????? ????????????"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.1
    }


}

