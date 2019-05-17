//
//  NSLCViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit

class NSLCViewController: UIViewController {
    
    let box = UIView()
    
    var didSetupConstraints = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NSLayoutConstraint"
        
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(box)
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            let boxConstraints = [
                NSLayoutConstraint(item: box, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: box, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: box, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150.0),
                NSLayoutConstraint(item: box, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150.0)
            ]
            NSLayoutConstraint.activate(boxConstraints)
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

}
