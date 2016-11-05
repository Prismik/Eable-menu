//
//  Colors.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

public class Colors {
    private class func rgb(r red: CGFloat, g green: CGFloat, b blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255, alpha: 1)
    }
    class func eablePink() -> UIColor {
        return rgb(r: 238, g: 99, b: 131)
    }
    
    class func eableViolet() -> UIColor {
        return rgb(r: 162, g: 146, b: 199)
    }
    
    class func eableDarkViolet() -> UIColor {
        return rgb(r: 129, g: 119, b: 157)
    }
    
    class func eableGrey() -> UIColor {
        return rgb(r: 172, g: 172, b: 172)
    }
    
    class func eableClay() -> UIColor {
        return rgb(r: 233, g: 228, b: 222)
    }
    
    class func eableBlack() -> UIColor {
        return rgb(r: 79, g: 80, b: 97)
    }
}