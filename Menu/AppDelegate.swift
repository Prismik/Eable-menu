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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootView: MainViewController = MainViewController(nibName: nil, bundle: nil)
        self.window = UIWindow(frame:UIScreen.main.bounds)
        
        if let window = self.window {
            window.makeKeyAndVisible()
            
            
            window.backgroundColor = UIColor.white
            
            let rootNavigation: UINavigationController = TopMenuController(root: rootView)
            rootNavigation.navigationBar.tintColor = UIColor.white
            rootNavigation.navigationBar.barTintColor = Colors.eableBlack()
            rootNavigation.navigationBar.isTranslucent = false
            rootNavigation.navigationBar.barStyle = UIBarStyle.black
            
            UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName: Colors.eableClay(),
                NSFontAttributeName: UIFont(name: "SFUIText-Regular", size: 16)!
            ]
            
            if let statusBar = (UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject).value(forKey: "statusBar") as? UIView {
                statusBar.backgroundColor = Colors.eableBlack()
            }
            
            window.rootViewController = rootNavigation;
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}

