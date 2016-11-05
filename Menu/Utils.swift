//
//  Utils.swift
//  OmegaFence
//
//  Created by Francis Beauchamp on 2016-08-31.
//  Copyright © 2016 Metaltech. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

public class Utils {
    class func removeTableViewCellBorders(cell: UITableViewCell) {
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
    }
    
    class func resizeImage(image: UIImage, newSize: CGSize) -> (UIImage) {
        let newRect = CGRectIntegral(CGRectMake(0,0, newSize.width, newSize.height))
        let imageRef = image.CGImage
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Set the quality level to use when rescaling
        CGContextSetInterpolationQuality(context, .High)
        let flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height)
        
        CGContextConcatCTM(context, flipVertical)
        // Draw into the context; this scales the image
        CGContextDrawImage(context, newRect, imageRef)
        
        let newImageRef = CGBitmapContextCreateImage(context)! as CGImage
        let newImage = UIImage(CGImage: newImageRef)
        
        // Get the resized image from the context and a UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    class func listAvailableFonts() {
        for family: String in UIFont.familyNames() {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family) {
                print("== \(names)")
            }
        }
    }
    
    class func prepareMail(title: String, body: String, recipient: String, attachment: String?) -> MFMailComposeViewController? {
        if MFMailComposeViewController.canSendMail() {
            let mc = MFMailComposeViewController()
            mc.setSubject(title)
            mc.setMessageBody(body, isHTML: true)
            mc.setToRecipients([recipient])
            if let data = attachment?.dataUsingEncoding(NSUTF8StringEncoding) {
                mc.addAttachmentData(data, mimeType: "application/csv", fileName: "submission.csv")
            }
            
            return mc
        }
        else {
            print("No email account found")
            return nil
        }
    }
}