//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Jayven Nhan on 2/12/17.
//  Copyright © 2017 Jayven Nhan. All rights reserved.
//

import UIKit
import DZNEmptyDataSet;

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DZNEmptyDataSetDelegate,DZNEmptyDataSetSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.emptyDataSetSource = self;
        self.collectionView.emptyDataSetDelegate = self;
        configureCVLayout()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
        let activityView = UIView()
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.white
        label.text = "Nohting found here!"
        label.textAlignment = NSTextAlignment.center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        activityView.addSubview(label)

        let widthConstraint = label.widthAnchor.constraint(equalToConstant: 200)
        let heightConstraint = label.heightAnchor.constraint(equalTo: activityView.heightAnchor, multiplier: 1)
        let horizontalConstraint = label.centerXAnchor.constraint(equalTo: activityView.centerXAnchor, constant: 1)
        let verticalConstraint = label.centerYAnchor.constraint(equalTo: activityView.centerYAnchor, constant: 1)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

        
        return activityView;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UICollectionViewCell {
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func configureCVLayout() {
        
        let screenWidth = view.frame.size.width
        let insetLeft = CGFloat(30)
        let insetRight = CGFloat(30)
        
        let itemSpacing: CGFloat = insetLeft - 10
        let itemWidth = screenWidth - (insetLeft * 2)
        let itemHeight = itemWidth
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: insetLeft, bottom: 0, right: insetRight)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        print("Cell Width: \(itemWidth), Cell Height: \(itemHeight)")
        
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        
        layout.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }


}

