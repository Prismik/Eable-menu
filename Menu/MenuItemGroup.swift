//
//  MenuItemGroup.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation

class MenuItemGroup: MenuNode {
    private var groupTitle: String
    private var groupSubtitle: String
    private var visibleFrom: Int = 0
    private var visibleTo: Int = 24
    private var childrenNode: [String: [MenuNode]] = [:]
    private var childrenOrder: [String] = []
    
    init(title t: String, subtitle s: String) {
        groupTitle = t
        groupSubtitle = s
    }
    
    func title() -> String {
        return groupTitle
    }
    
    func subtitle() -> String {
        return groupSubtitle
    }
    
    func makeAlwaysVisible() {
        visibleFrom = 0
        visibleTo = 24
    }
    
    func setVisibleInterval(from: Int, to: Int) {
        visibleFrom = from
        visibleTo = to
    }
    
    func shouldBeDisplayed() -> Bool {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.Hour, fromDate: date)
        let hour = components.hour
        
        return visibleFrom <= hour && hour <= visibleTo
    }
    
    func showContainedItem() {
        //
    }
    
    func show() {
        
    }
    
    func select() {
        
    }
    
    func addChild(node: MenuNode, toCategory category: String) {
        if childrenNode[category] == nil {
            childrenOrder.append(category)
            childrenNode[category] = []
            childrenNode[category]!.append(node)
        }
        else {
            childrenNode[category]!.append(node)
        }
    }
    
    func children() -> [String: [MenuNode]] {
        return childrenNode
    }
    
    func order() -> [String] {
        return childrenOrder
    }
}

protocol MenuNode {
    func showContainedItem()
    func show()
    func select()
    func title() -> String
    func subtitle() -> String
}