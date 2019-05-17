//
//  HomeViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    
    let menuItems = [
        "Autolayout with NSLayoutConstraint",
        "Autolayout with SnapKit",
        "UITableView Custom Cell",
        "UICollectionView",
        "Alamofire"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "iOS Training Demo"
        self.listView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.listView.dataSource = self
        self.listView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = menuItems[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let controller = NSLCViewController(nibName: "NSLCViewController", bundle: nil)
            self.navigationController?.show(controller, sender: nil)
        }
        
        if indexPath.row == 1 {
            let controller = SnapKitViewController(nibName: "SnapKitViewController", bundle: nil)
            self.navigationController?.show(controller, sender: nil)
        }
        
        if indexPath.row == 2 {
            let controller = TableViewViewController(nibName: "TableViewViewController", bundle: nil)
            self.navigationController?.show(controller, sender: nil)
        }
        
        if indexPath.row == 3 {
            let controller = CollectionViewViewController(nibName: "CollectionViewViewController", bundle: nil)
            self.navigationController?.show(controller, sender: nil)
        }
        
        if indexPath.row == 4 {
            let controller = AlamofireViewController(nibName: "AlamofireViewController", bundle: nil)
            self.navigationController?.show(controller, sender: nil)
        }
    }
    
}
