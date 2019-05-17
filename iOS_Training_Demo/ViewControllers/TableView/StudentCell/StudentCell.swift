//
//  StudentCell.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit
import Kingfisher

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.avataImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ student: StudentClass) {
        self.studentNameLabel.text = student.name
        self.avataImageView.kf.indicatorType = .activity
        self.avataImageView.kf.setImage(with: URL(string: student.avatarUrl))
    }
    
}
