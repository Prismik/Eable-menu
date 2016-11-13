//
//  SubViewController.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

class SubViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var subView: SubView!
    var tableView: UITableView!
    var items: [String: [MenuNode]] = [:]
    var dataOrder: [String] = []
    init(title: String, children: [String: [MenuNode]], order: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        items = children
        dataOrder = order
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = Colors.eableViolet()
        
        let navigationController = self.navigationController as! TopMenuController
        navigationController.navigationBar.backItem?.title = "Back"
        
        self.tableView = UITableView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "subtitleCell")
        self.tableView.rowHeight = 50
        self.tableView.backgroundColor = Colors.eableBlack()
        self.tableView.separatorColor = Colors.eableClay()
        self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.shared.statusBarFrame.size.height)
        
        self.view.addSubview(self.tableView)
        //self.subView = SubView(controller: self)
        //self.subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items[dataOrder[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let topMenu = self.navigationController as? TopMenuController {
            let title: String = dataOrder[indexPath.section]
            let selectedItem: MenuNode = items[title]![indexPath.row]
            if let group: MenuItemGroup = selectedItem as? MenuItemGroup {
                let controller = SubViewController(title: selectedItem.title(), children: group.children(), order: group.order())
                topMenu.pushViewController(controller, animated: true)
            }
            else if let item: MenuItem = selectedItem as? MenuItem {
                let controller = ProductViewController(item: item)
                topMenu.pushViewController(controller, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Gets the header view as a UITableViewHeaderFooterView and changes the text colour and adds above blur effect
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = Colors.eableBlack()
        headerView.textLabel!.font = UIFont(name: "SFUIText-Bold", size: 14)!
        headerView.tintColor = Colors.eableClay()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataOrder[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title: String = dataOrder[indexPath.section]
        let item = items[title]![indexPath.row]
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "subtitleCell")
        cell.backgroundColor = Colors.eableBlack()
        cell.textLabel?.textColor = Colors.eableClay()
        cell.textLabel?.font = UIFont(name: "SFUIText-Bold", size: 12)!
        cell.textLabel?.text = item.title()
        cell.detailTextLabel?.text = item.subtitle()
        cell.detailTextLabel?.textColor = Colors.eableViolet()
        cell.detailTextLabel?.font = UIFont(name: "SFUIText-Regular", size: 12)!
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        return cell
    }
}
