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
    
    var items: [String: [MenuItemGroup]] = [:]
    let dataOrder: [String] = ["Meals", "Drinks"]
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Eable Menu"
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationItem.title = "Back"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var breakfast = MenuItemGroup(title: "Breakfasts", subtitle: "Available until 13:00")
        // Eggs
        breakfast.addChild(MenuItem(title: "Special Toasty", subtitle: "2 eggs, 2 choices of meat, baked beans, crepe & french toast"), toCategory: "Eggs")
        breakfast.addChild(MenuItem(title: "Scrambled", subtitle: "2 scrambled eggs with spinach & cheddar"), toCategory: "Eggs")
        // Sandwiches
        breakfast.addChild(MenuItem(title: "Deluxe grilled cheese", subtitle: "Cheddar, bacon, egg"), toCategory: "Morning sandwiches")
        breakfast.addChild(MenuItem(title: "BLT", subtitle: "Bacon, lettuce, tomatoes"), toCategory: "Morning sandwiches")
        // Benedicts
        breakfast.addChild(MenuItem(title: "Traditional", subtitle: "Ham, cheddar, hollandaise"), toCategory: "Benedicts")
        breakfast.addChild(MenuItem(title: "Florentine", subtitle: "Spinach, cheddar, hollandaise"), toCategory: "Benedicts")
        breakfast.addChild(MenuItem(title: "Forestier", subtitle: "Mushrooms, swiss cheese, hollandaise"), toCategory: "Benedicts")
        // Omelets
        breakfast.addChild(MenuItem(title: "Champêtre", subtitle: "Sausage, mushrooms, cheese"), toCategory: "Omelets")
        breakfast.addChild(MenuItem(title: "Western", subtitle: "Peppers, red onions, ham, cheese"), toCategory: "Omelets")
        breakfast.addChild(MenuItem(title: "Campagnarde", subtitle: "Ham, asparagus"), toCategory: "Omelets")
        
        var lunches = MenuItemGroup(title: "Lunches", subtitle: "Specials on friday")
        var suppers = MenuItemGroup(title: "Supper", subtitle: "Starting from 15:00")
        
        var juices = MenuItemGroup(title: "Juices", subtitle: "The best juices in town")
        var water = MenuItemGroup(title: "Water", subtitle: "Freely available, JUST FOR YOU")
        var alchohol = MenuItemGroup(title: "Alchoholic delights", subtitle: "Adults only")
        var coffee = MenuItemGroup(title: "Coffees", subtitle: "Pack a punch")
        
        items["Meals"] = [breakfast, lunches, suppers]
        items["Drinks"] = [juices, water, alchohol, coffee]
        
        // Do any additional setup after loading the view, typically from a nib.
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

