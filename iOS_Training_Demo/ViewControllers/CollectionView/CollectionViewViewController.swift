//
//  CollectionViewViewController.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController {
    
    @IBOutlet weak var listView: UICollectionView!
    
    var array = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listView.dataSource = self
        self.listView.delegate = self
        self.listView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        self.listView.collectionViewLayout = layout
    }

}

extension CollectionViewViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        cell?.titleLabel.text = array[indexPath.item]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10.0 - 10.0 - 10.0) * 1/2
        return CGSize(width: width, height: width)
    }

    
}
