//
//  ProductViewController.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-11.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MenuItemOptionDelegate {
    var productView: ProductView!
    var currentItem: MenuItem
    
    init(item: MenuItem) {
        currentItem = item
        super.init(nibName: nil, bundle: nil)
        
        self.title = item.title()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = Colors.eableBlack()
        
        let navigationController = self.navigationController as! TopMenuController
        navigationController.navigationBar.backItem?.title = "Back"
        
        productView = ProductView(controller: self)
        productView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.shared.statusBarFrame.size.height)
        
        self.view.addSubview(productView)
        productView.appear()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        if self.isMovingFromParentViewController
        {
            currentItem.resetOptions()
        }
    }
    
    private func order() {
        
    }
    
    func orderChallenge() {
        // TODO Try to http send the request
        let id: String = "A1BC2-D3EF4-G5HI6"
        let params: Parameters? = [
            "title": self.currentItem.title(),
            "cost": self.currentItem.cost()
        ]
        
        let url = "http://127.0.0.1:8080/orders/\(id)"
        let header: HTTPHeaders? = nil
        let encoding: ParameterEncoding = JSONEncoding.default
        let post = HTTPMethod.post
        
        Alamofire.request(url, method: post, parameters: params, encoding: encoding, headers: header).responseJSON { response in
            if response.result.isSuccess {
                if let value = response.result.value {
                    let json = JSON(value)
                    if json["status"].string == "success" {
                        SweetAlert().showAlert("A fine choice", subTitle: "We will shortly prepare your order !", style: AlertStyle.success)
                    }
                }
            }
        }

        // TODO Spinner
    }
    
    func didToggleOption() {
        self.productView.priceLabel.text = "\(currentItem.cost()) $"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItem.options().count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Gets the header view as a UITableViewHeaderFooterView and changes the text colour and adds above blur effect
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = Colors.eableBlack()
        headerView.textLabel!.font = UIFont(name: "SFUIText-Bold", size: 14)!
        headerView.tintColor = Colors.eableClay()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Options"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MenuItemOptionCell = MenuItemOptionCell(style: UITableViewCellStyle.value1, reuseIdentifier: "option", option: currentItem.options()[indexPath.row], parent: self)
        //cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
}
