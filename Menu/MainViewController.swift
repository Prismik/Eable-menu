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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Eable Menu"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Back"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let breakfast = MenuItemGroup(title: "Breakfasts", subtitle: "Available until 13:00")
        // Eggs
        breakfast.addChild(MenuItem(cost: 7, title: "Special Toasty", subtitle: "2 eggs, 2 choices of meat, baked beans, crepe & french toast", description: ""), toCategory: "Eggs")
        breakfast.addChild(MenuItem(cost: 7, title: "Scrambled", subtitle: "2 scrambled eggs with spinach & cheddar", description: ""), toCategory: "Eggs")
        // Sandwiches
        breakfast.addChild(MenuItem(cost: 9, title: "Deluxe grilled cheese", subtitle: "Cheddar, bacon, egg", description: ""), toCategory: "Morning sandwiches")
        breakfast.addChild(MenuItem(cost: 8, title: "BLT", subtitle: "Bacon, lettuce, tomatoes", description: ""), toCategory: "Morning sandwiches")
        // Benedicts
        let traditional = MenuItem(cost: 14, title: "Traditional", subtitle: "Ham, cheddar, hollandaise", description: "Served with fresh fruits & roasted potatoes + coffee or tea With toast +1$")
        traditional.addOption(option: MenuItemOption(title: "Toast", cost: 1.0, enabledByDefault: false))
        breakfast.addChild(traditional, toCategory: "Benedicts")
        breakfast.addChild(MenuItem(cost: 12, title: "Florentine", subtitle: "Spinach, cheddar, hollandaise", description: ""), toCategory: "Benedicts")
        breakfast.addChild(MenuItem(cost: 10, title: "Forestier", subtitle: "Mushrooms, swiss cheese, hollandaise", description: ""), toCategory: "Benedicts")
        // Omelets
        breakfast.addChild(MenuItem(cost: 11, title: "Champêtre", subtitle: "Sausage, mushrooms, cheese", description: ""), toCategory: "Omelets")
        breakfast.addChild(MenuItem(cost: 12, title: "Western", subtitle: "Peppers, red onions, ham, cheese", description: ""), toCategory: "Omelets")
        breakfast.addChild(MenuItem(cost: 9, title: "Campagnarde", subtitle: "Ham, asparagus", description: ""), toCategory: "Omelets")
        
        let lunches = MenuItemGroup(title: "Lunches", subtitle: "Specials on friday")
        let suppers = MenuItemGroup(title: "Supper", subtitle: "Starting from 15:00")
        
        let juices = MenuItemGroup(title: "Juices", subtitle: "The best juices in town")
        let water = MenuItemGroup(title: "Water", subtitle: "Freely available, JUST FOR YOU")
        let alchohol = MenuItemGroup(title: "Alchoholic delights", subtitle: "Adults only")
        let coffee = MenuItemGroup(title: "Coffees", subtitle: "Pack a punch")
        
        items["Meals"] = [breakfast, lunches, suppers]
        items["Drinks"] = [juices, water, alchohol, coffee]
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = Colors.eableBlack()
        
        //let navigationController = self.navigationController as! TopMenuController
        
        self.mainView = MainView(controller: self)
        self.mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.shared.statusBarFrame.size.height)
        
        self.view.addSubview(self.mainView)
        self.mainView.appear()
        self.mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "subtitleCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
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
        cell.tintColor = Colors.eableClay()
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        return cell
    }
}

