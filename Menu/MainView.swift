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
        let titleBox = UIView()
        titleBox.translatesAutoresizingMaskIntoConstraints = false
        titleBox.backgroundColor = Colors.eableDarkViolet()
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "What would you like to order now"
        title.numberOfLines = 2
        title.font = UIFont(name: "SFUIText-Regular", size: 18)!
        titleBox.addSubview(title)
        self.addSubview(titleBox)
        
        self.tableView = UITableView()
        self.tableView.dataSource = self.controller
        self.tableView.delegate = self.controller
        self.tableView.rowHeight = 60
        
        self.addSubview(self.tableView)
        
        let views: [String: UIView] = [
            "title": titleBox,
            "table": tableView
        ]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[title]-0-|",
            options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[table]-0-|",
            options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[title]-0-[table]-15-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: views))
    }
}
