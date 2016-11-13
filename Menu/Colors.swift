//
//  Colors.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

open class Colors {
    private class func rgb(r red: CGFloat, g green: CGFloat, b blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255, alpha: 1)
    }
    
    class func eableViolet() -> UIColor {
        return rgb(r: 192, g: 108, b: 132)
    }
    
    class func eableDarkViolet() -> UIColor {
        return rgb(r: 108, g: 91, b: 123)
    }
    
    class func eableClay() -> UIColor {
        return rgb(r: 248, g: 177, b: 149)
    }
    
    class func eableBlack() -> UIColor {
        return rgb(r: 53, g: 92, b: 125)
    }
}
