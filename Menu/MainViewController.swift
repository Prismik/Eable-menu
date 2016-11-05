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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let valueCounts: [Int] = items.values.map({ $0.count })
        return valueCounts[section]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //if let cell = tableView.cellForRowAtIndexPath(indexPath) as? FenceSelectorTableCell {
        //    self.cellSelectionDelegate.didSelectFenceModel(cell.parameters)
        //    if let topMenu = self.navigationController as? TopMenuController {
        //        topMenu.popViewControllerAnimated(true)
        //    }
        //}
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles: [String] = items.keys.map({ $0 })
        return titles[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let titles: [String] = items.keys.map({ $0 })
        let title: String = titles[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = items[title]![indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
}

