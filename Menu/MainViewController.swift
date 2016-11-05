//
//  MainViewController.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mainView: MainView!
    var items: [String: [String]] = [
        "Meals": ["Breakfasts", "Lunches", "Supper"],
        "Drinks": ["Juices", "Water", "Alchoholic delights", "Coffees"]
    ]
    let dataOrder: [String] = ["Meals", "Drinks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Eable Menu"
        self.view.backgroundColor = Colors.eableViolet()
        
        let navigationController = self.navigationController as! TopMenuController
        
        self.mainView = MainView(controller: self)
        self.mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height)
        
        self.view.addSubview(self.mainView)
        self.mainView.appear()
        self.mainView.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "subtitleCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items[dataOrder[section]]?.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //if let cell = tableView.cellForRowAtIndexPath(indexPath) as? FenceSelectorTableCell {
        //    self.cellSelectionDelegate.didSelectFenceModel(cell.parameters)
        //    if let topMenu = self.navigationController as? TopMenuController {
        //        topMenu.popViewControllerAnimated(true)
        //    }
        //}
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
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subtitleCell")
        cell.backgroundColor = Colors.eableBlack()
        cell.textLabel?.textColor = Colors.eablePink()
        cell.textLabel?.font = UIFont(name: "SFUIText-Bold", size: 12)!
        cell.textLabel?.text = items[title]![indexPath.row]
        cell.detailTextLabel?.text = "Detail"
        cell.detailTextLabel?.textColor = Colors.eablePink()
        cell.detailTextLabel?.font = UIFont(name: "SFUIText-Regular", size: 12)!
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}

