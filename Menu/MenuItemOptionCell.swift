//
//  MenuItemOptionCell.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-24.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

class MenuItemOptionCell: UITableViewCell {
    let delegate: MenuItemOptionDelegate
    let itemOption: MenuItemOption
    init(style: UITableViewCellStyle, reuseIdentifier: String?, option: MenuItemOption, parent: MenuItemOptionDelegate) {
        itemOption = option
        delegate = parent
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsets.zero
        self.separatorInset = UIEdgeInsets.zero
        
        let optionLabel: UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 100, height: 30))
        optionLabel.text = itemOption.title()
        optionLabel.font = UIFont(name: "SFUIText-Regular", size: 12)!
        optionLabel.textColor = Colors.eableClay()
        self.contentView.addSubview(optionLabel)
        
        let optionToggle = UISwitch(frame: CGRect(x: 260, y: 0, width: 50, height: 20))
        optionToggle.addTarget(self, action: #selector(toggleOption), for: UIControlEvents.valueChanged)
        optionToggle.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        optionToggle.tintColor = Colors.eableRed()
        optionToggle.backgroundColor = Colors.eableRed()
        optionToggle.layer.cornerRadius = 16
        self.contentView.addSubview(optionToggle)
        
        self.contentView.backgroundColor = Colors.eableBlack()
        
        let view = UIView()
        view.backgroundColor = Colors.eableBlack()
        self.selectedBackgroundView = view
    }
    
    func toggleOption() {
        self.itemOption.toggle()
        self.delegate.didToggleOption()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc public protocol MenuItemOptionDelegate {
    func didToggleOption()
}
