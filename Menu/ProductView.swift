//
//  ProductView.swift
//  Menu
//
//  Created by Francis Beauchamp on 2016-11-11.
//  Copyright © 2016 Eable. All rights reserved.
//

import Foundation
import UIKit

class ProductView: UIView {
    var controller: ProductViewController
    var priceLabel: UILabel!
    init(controller: ProductViewController) {
        self.controller = controller
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildSubtitleWing() -> UIView {
        let wing: UIView = UIView()
        wing.translatesAutoresizingMaskIntoConstraints = false
        wing.backgroundColor = Colors.eableClay()
        
        return wing
    }
    
    func appear() {
        let headerContainer = UIView()
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let wingA = buildSubtitleWing()
        headerContainer.addSubview(wingA)
        let spacerA = UIView()
        spacerA.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(spacerA)
        
        let wingB = buildSubtitleWing()
        headerContainer.addSubview(wingB)
        let spacerB = UIView()
        spacerB.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(spacerB)
        
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = NSTextAlignment.center
        description.text = controller.currentItem.description()
        description.numberOfLines = 3
        description.font = UIFont(name: "SFUIText-Bold", size: 12)!
        description.textColor = Colors.eableClay()
        headerContainer.addSubview(description)
        
        let headerViews: [String: UIView] = ["spacerA": spacerA, "wingA": wingA, "spacerB": spacerB, "wingB": wingB, "subtitle": description]
        headerContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[spacerA]-[wingA(25)]-10-[subtitle(200)]-10-[wingB(25)]-[spacerB]-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: headerViews))
        
        headerContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[subtitle(60)]-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: headerViews))
        
        headerContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[wingA(2)]-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: headerViews))
        
        headerContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[wingB(2)]-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: headerViews))
        
        self.addSubview(headerContainer)
        
        let itemImage = UIImageView(image: UIImage(named: "benedict.jpg")!)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.contentMode = .scaleAspectFill
        
        self.addSubview(itemImage)
        
        //let imageSpacer = UIView()
        //imageSpacer.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = NSTextAlignment.center
        subtitle.text = controller.currentItem.subtitle()
        subtitle.font = UIFont(name: "SFUIText-Bold", size: 12)!
        subtitle.textColor = Colors.eableClay()
        
        self.addSubview(subtitle)
        
        let optionsTable = UITableView()
        optionsTable.translatesAutoresizingMaskIntoConstraints = false
        optionsTable.rowHeight = 30
        optionsTable.backgroundColor = Colors.eableBlack()
        optionsTable.separatorColor = Colors.eableClay()
        optionsTable.dataSource = self.controller
        optionsTable.delegate = self.controller
        optionsTable.register(MenuItemOptionCell.self, forCellReuseIdentifier: "option")
        
        self.addSubview(optionsTable)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = NSTextAlignment.center
        priceLabel.text = "\(controller.currentItem.cost()) $"
        priceLabel.font = UIFont(name: "SFUIText-Bold", size: 21)!
        priceLabel.textColor = Colors.eableClay()

        self.addSubview(priceLabel)
        
        let order = UIButton(type: UIButtonType.custom)
        order.translatesAutoresizingMaskIntoConstraints = false
        order.backgroundColor = Colors.eableViolet()
        order.setTitle("Order now", for: UIControlState.normal)
        order.setTitleColor(Colors.eableClay(), for: UIControlState.normal)
        order.titleLabel?.textColor = Colors.eableClay()
        order.addTarget(self.controller, action: #selector(controller.orderChallenge), for: UIControlEvents.touchUpInside)
        
        self.addSubview(order)
        
        let views: [String: UIView] = ["header": headerContainer, "image": itemImage, "subtitle": subtitle, "options": optionsTable, "price": priceLabel, "order": order]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[header(300)]-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[image]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[subtitle]-15-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[options]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[price]-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[order]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[header(60)]-15-[image(200)]-5-[subtitle(30)]-5-[options(90)]-10-[price]-10-[order(50)]-0-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: views))
        
    }
}
