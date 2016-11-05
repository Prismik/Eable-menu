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
    
    init(controller: MainViewController) {
        self.controller = controller
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func appear() {
        let titleBox = UIView()
        titleBox.translatesAutoresizingMaskIntoConstraints = false
        titleBox.backgroundColor = Colors.eableDarkViolet()
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "What would you like to order now"
        title.numberOfLines = 2
        
    }
}
