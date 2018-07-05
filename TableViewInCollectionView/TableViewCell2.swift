//
//  TableViewCell2.swift
//  TableViewInCollectionView
//
//  Created by SMSCountry Networks Pvt. Ltd on 03/07/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

protocol VideocollectionviewDidSelectDelegate {
    func videocollectionViewDidSeletClicked(selectedPath : IndexPath)
}


class TableViewCell2: UITableViewCell, VideocollectionviewDidSelectDelegate {
    func videocollectionViewDidSeletClicked(selectedPath: IndexPath) {
        
    }
    

    @IBOutlet var collectionView2: UICollectionView!
    
    var delegateobj : VideocollectionviewDidSelectDelegate!
    var arrOfvideoNames = ["SampleVideo", "small", "SampleVideo",  "small", "SampleVideo", "small"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView2.dataSource = self as UICollectionViewDataSource
        collectionView2.delegate = self as UICollectionViewDelegate
     
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//extension TableViewCell2 {
//
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
//        collectionView2.delegate = dataSourceDelegate
//        collectionView2.dataSource = dataSourceDelegate
//        collectionView2.tag = 1
//        collectionView2.setContentOffset(collectionView2.contentOffset, animated: false)
//        collectionView2.reloadData()
//    }
//
//    var collectionViewOffset: CGFloat {
//        set { collectionView2.contentOffset.x = newValue }
//        get { return collectionView2.contentOffset.x }
//    }
//}

extension TableViewCell2: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfvideoNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! CollectionViewCell2
        cell.lblOfVideoNames.text = arrOfvideoNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegateobj {
        delegate.videocollectionViewDidSeletClicked(selectedPath: indexPath)
        }
//        let story = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = story.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
//        //vc.image = arrof[indexPath.item] as NSString
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

