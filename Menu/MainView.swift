//
//  MainView.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    var controller: MainViewController
    var tableView: UITableView!
    
    init(controller: MainViewController) {
        self.controller = controller
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appear() {
        /*
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "What would you like to order now"
        title.numberOfLines = 2
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: "SFUIText-Bold", size: 28)!
        title.textColor = Colors.eableDarkViolet()
        title.backgroundColor = Colors.eablePink()
        self.addSubview(title)
        */
        self.tableView = UITableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.backgroundColor = Colors.eableBlack()
        self.tableView.separatorColor = Colors.eableClay()
        self.tableView.dataSource = self.controller
        self.tableView.delegate = self.controller
        self.tableView.rowHeight = 50
        
        self.addSubview(self.tableView)
        
        let views: [String: UIView] = [
           // "title": title,
            "table": tableView
        ]
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[title]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[table]-0-|",
            options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[table]-15-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: views))
    }
}
