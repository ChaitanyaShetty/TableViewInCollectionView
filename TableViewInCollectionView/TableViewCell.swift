//
//  TableViewCell.swift
//  TableViewInCollectionView
//
//  Created by SMSCountry Networks Pvt. Ltd on 03/07/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

protocol collectionviewDidSelectDelegate {
    func collectionViewDidSeletClicked(CollectionIndexPath: IndexPath,tableViewIndexPath: IndexPath )
}

class TableViewCell: UITableViewCell, collectionviewDidSelectDelegate {
  
    
    func collectionViewDidSeletClicked(CollectionIndexPath: IndexPath,tableViewIndexPath: IndexPath ) {
        
    }
    

    
    var didselectdelegate : collectionviewDidSelectDelegate!
    @IBOutlet var collectionview: UICollectionView!
    
    var tableviewIndex:IndexPath!
    
    var arrOfcollectionViewImages = [String]()
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionview.dataSource = self as UICollectionViewDataSource
        collectionview.delegate = self as UICollectionViewDelegate
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
}
//
//extension TableViewCell {
//
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
//        collectionview.delegate = dataSourceDelegate
//        collectionview.dataSource = dataSourceDelegate
//        collectionview.tag = 0
//        collectionview.setContentOffset(collectionview.contentOffset, animated: false)
//        collectionview.reloadData()
//    }
//
//    var collectionViewOffset: CGFloat {
//        set { collectionview.contentOffset.x = newValue }
//        get { return collectionview.contentOffset.x }
//    }
//}


extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfcollectionViewImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell

        cell.imgView.image = UIImage(named: arrOfcollectionViewImages[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
         //  didselectdelegate = self
        if let delegate = didselectdelegate {
            delegate.collectionViewDidSeletClicked(CollectionIndexPath: indexPath, tableViewIndexPath: tableviewIndex)
        }



    }



}

