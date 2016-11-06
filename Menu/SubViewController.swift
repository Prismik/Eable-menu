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
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "subtitleCell")
        self.tableView.rowHeight = 50
        self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height)
        
        self.view.addSubview(self.tableView)
        //self.subView = SubView(controller: self)
        //self.subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items[dataOrder[section]]?.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let topMenu = self.navigationController as? TopMenuController {
            let title: String = dataOrder[indexPath.section]
            let selectedItem: MenuNode = items[title]![indexPath.row]
            if let group: MenuItemGroup = selectedItem as? MenuItemGroup {
                let controller = SubViewController(title: selectedItem.title(), children: group.children(), order: group.order())
                topMenu.pushViewController(controller, animated: true)
            }
            else if let item: MenuItem = selectedItem as? MenuItem {
                
            }
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Gets the header view as a UITableViewHeaderFooterView and changes the text colour and adds above blur effect
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel!.textColor = Colors.eableBlack()
        headerView.textLabel!.font = UIFont(name: "SFUIText-Bold", size: 14)!
        headerView.tintColor = Colors.eableViolet()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataOrder[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let title: String = dataOrder[indexPath.section]
        let item = items[title]![indexPath.row]
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subtitleCell")
        cell.backgroundColor = Colors.eableBlack()
        cell.textLabel?.textColor = Colors.eablePink()
        cell.textLabel?.font = UIFont(name: "SFUIText-Bold", size: 12)!
        cell.textLabel?.text = item.title()
        cell.detailTextLabel?.text = item.subtitle()
        cell.detailTextLabel?.textColor = Colors.eablePink()
        cell.detailTextLabel?.font = UIFont(name: "SFUIText-Regular", size: 12)!
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}