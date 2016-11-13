//
//  MenuItem.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation

class MenuItem: MenuNode {
    private var itemTitle: String
    private var itemSubtitle: String
    private var itemDescription: String
    private var itemOptions: [MenuItemOption] = []
    private var baseCost: Double = 0
    // private var image
    init(cost: Double, title: String, subtitle: String, description: String) {
        baseCost = cost
        itemTitle = title
        itemSubtitle = subtitle
        itemDescription = description
    }
    
    func title() -> String {
       return itemTitle
    }
    
    func subtitle() -> String {
       return itemSubtitle
    }
    
    func description() -> String {
        return itemDescription
    }
    
    func showContainedItem() {
        //
    }
    
    func show() {
        
    }
    
    func select() {
        
    }
    
    func addOption(option: MenuItemOption) {
        itemOptions.append(option)
    }
    
    func options() -> [MenuItemOption] {
        return itemOptions
    }
    
    func cost() -> Double {
        return baseCost + itemOptions.filter({ option in return option.enabled() }).reduce(0.0, { $0 + $1.cost() })
    }
}
