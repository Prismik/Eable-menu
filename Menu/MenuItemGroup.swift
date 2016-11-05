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
    private var children: [MenuNode] = []
    
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
    
    func addChild(node: MenuNode) {
        children.append(node)
    }
    
    func getChildren() -> [(String, String)] {
        return children.map({ item in return (item.title(), item.subtitle()) })
    }
}

protocol MenuNode {
    func showContainedItem()
    func show()
    func select()
    func title() -> String
    func subtitle() -> String
}