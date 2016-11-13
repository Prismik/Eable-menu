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

open class Utils {
    class func removeTableViewCellBorders(_ cell: UITableViewCell) {
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
    }
    
    class func resizeImage(_ image: UIImage, newSize: CGSize) -> (UIImage) {
        let newRect = CGRect(x: 0,y: 0, width: newSize.width, height: newSize.height).integral
        let imageRef = image.cgImage
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // Set the quality level to use when rescaling
        context!.interpolationQuality = .high
        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
        
        context?.concatenate(flipVertical)
        // Draw into the context; this scales the image
        context?.draw(imageRef!, in: newRect)
        
        let newImageRef = (context?.makeImage()!)! as CGImage
        let newImage = UIImage(cgImage: newImageRef)
        
        // Get the resized image from the context and a UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    class func listAvailableFonts() {
        for family: String in UIFont.familyNames {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }
    
    class func prepareMail(_ title: String, body: String, recipient: String, attachment: String?) -> MFMailComposeViewController? {
        if MFMailComposeViewController.canSendMail() {
            let mc = MFMailComposeViewController()
            mc.setSubject(title)
            mc.setMessageBody(body, isHTML: true)
            mc.setToRecipients([recipient])
            if let data = attachment?.data(using: String.Encoding.utf8) {
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
