//
//  TableViewViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    
    let students = [
        StudentClass(name: "Hao", avatarUrl: "https://www.timeshighereducation.com/sites/default/files/styles/the_breaking_news_image_style/public/istock-619066144.jpg?itok=qc3nppWL"),
        StudentClass(name: "Minh", avatarUrl: "https://s16815.pcdn.co/wp-content/uploads/2017/06/iStock-609683672-studying.jpg"),
        StudentClass(name: "Nghia", avatarUrl: "https://s16815.pcdn.co/wp-content/uploads/2017/06/iStock-609683672-studying.jpg"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UITableView Custom Cell"
        self.listView.register(UINib(nibName: "StudentCell", bundle: nil), forCellReuseIdentifier: "StudentCell")
        self.listView.dataSource = self
        self.listView.delegate = self
    }
    
}

extension TableViewViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as? StudentCell
        cell?.setData(students[indexPath.row])
        return cell!
    }
    
}
