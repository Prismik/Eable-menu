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
    // private var image
    init(title: String, subtitle: String) {
        itemTitle = title
        itemSubtitle = subtitle
    }
    
    func title() -> String {
       return itemTitle
    }
    
    func subtitle() -> String {
       return itemSubtitle
    }
    
    func showContainedItem() {
        //
    }
    
    func show() {
        
    }
    
    func select() {
        
    }
}
