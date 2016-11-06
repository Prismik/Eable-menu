//
//  SubView.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

class SubView: UIView {
    var controller: SubViewController
    
    init(controller: SubViewController) {
        self.controller = controller
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appear() {
        
    }
}