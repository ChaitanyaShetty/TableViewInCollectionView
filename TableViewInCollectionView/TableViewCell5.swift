//
//  TableViewCell5.swift
//  TableViewInCollectionView
//
//  Created by SMSCountry Networks Pvt. Ltd on 04/07/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

class TableViewCell5: UITableViewCell {

    @IBOutlet var collectionview5: UICollectionView!
    var arrOfcollectionViewImages = ["IAS.png", "image5.png", "java.png", "permutationcombination", "image5.png"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionview5.dataSource = self as UICollectionViewDataSource
        collectionview5.delegate = self as UICollectionViewDelegate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

extension TableViewCell5: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfcollectionViewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview5.dequeueReusableCell(withReuseIdentifier: "cell5", for: indexPath) as! CollectionViewCell5
        cell.imgOfcollectionOfImages.image = UIImage(named: arrOfcollectionViewImages[indexPath.row])
        return cell
    }
    
  
    
}
