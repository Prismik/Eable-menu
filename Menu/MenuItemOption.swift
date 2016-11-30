//
//  MenuItemOption.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-11.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation

class MenuItemOption {
    private var description: String
    private var additionalCost: Double
    private var isEnabled: Bool
    init(title: String, cost: Double, enabledByDefault: Bool) {
        description = title
        additionalCost = cost
        isEnabled = enabledByDefault
    }
    
    func title() -> String { return description }
    func cost() -> Double { return additionalCost }
    func enabled() -> Bool { return isEnabled }
    
    func toggle() {
        isEnabled = !isEnabled
    }
    
    func reset() {
        isEnabled = false
    }
}
