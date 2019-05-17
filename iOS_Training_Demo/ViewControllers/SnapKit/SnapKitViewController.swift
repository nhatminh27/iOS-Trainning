//
//  SnapKitViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {
    
    let box = UIView()
    
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Snapkit"
        
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(box)
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            box.snp.makeConstraints { (make) in
                if #available(iOS 11.0, *) {
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20.0)
                } else {
                    make.top.equalTo(self.view.snp.top).offset(20.0)
                }
                make.left.equalTo(self.view.snp.left).offset(0.0)
                make.width.height.equalTo(150.0)
            }
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}
