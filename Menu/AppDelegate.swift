//
//  AppDelegate.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let rootView: MainViewController = MainViewController(nibName: nil, bundle: nil)
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        if let window = self.window {
            window.makeKeyAndVisible()
            
            
            window.backgroundColor = UIColor.whiteColor()
            
            let rootNavigation: UINavigationController = TopMenuController(root: rootView)
            rootNavigation.navigationBar.tintColor = UIColor.whiteColor()
            rootNavigation.navigationBar.barTintColor = Colors.eableBlack()
            rootNavigation.navigationBar.translucent = false
            rootNavigation.navigationBar.barStyle = UIBarStyle.Black
            
            UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName: UIColor.whiteColor()//,
                //NSFontAttributeName: UIFont(name: "SFUIText-Regular", size: 16)!
            ]
            
            if let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView {
                statusBar.backgroundColor = Colors.eableBlack()
            }
            
            window.rootViewController = rootNavigation;
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) { }
    func applicationDidEnterBackground(application: UIApplication) { }
    func applicationWillEnterForeground(application: UIApplication) { }
    func applicationDidBecomeActive(application: UIApplication) { }
    func applicationWillTerminate(application: UIApplication) { }
}

