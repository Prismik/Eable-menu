//
//  MainViewController.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-05.
//  Copyright © 2016 Eable. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Eable Menu"
        self.view.backgroundColor = Colors.eableViolet()
        
        let navigationController = self.navigationController as! TopMenuController
        
        self.mainView = MainView(controller: self)
        self.mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - self.navigationController!.navigationBar.frame.size.height - UIApplication.sharedApplication().statusBarFrame.size.height)
        
        self.view.addSubview(self.mainView)
        self.mainView.appear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

