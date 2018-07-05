//
//  ViewController.swift
//  TableViewInCollectionView
//
//  Created by SMSCountry Networks Pvt. Ltd on 03/07/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
 
    @IBOutlet var myTableview: UITableView!
    
     var arrOfvideoNames = ["SampleVideo", "small", "SampleVideo",  "small", "SampleVideo", "small"]
    var arrOfcollectionViewImages = ["IAS.png", "image5.png", "java.png", "permutationcombination", "image5.png"]
    var videos = ["SampleVideo", "small", "SampleVideo", "small", "SampleVideo", "small"]
     var images = ["probability.png", "@3xPage 1.png", "@1xGroup 4.png", "@3xGroup 5.png", "@3xGroup 7.png"]
    
    var numbers = ["1","2","3","4"]
    
    var storedOffsets = [Int: CGFloat]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//      myTableview.separatorStyle = .none
//      myTableview.tableFooterView = UIView(frame: .zero)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}

extension ViewController : UITableViewDataSource, UITableViewDelegate, collectionviewDidSelectDelegate, VideocollectionviewDidSelectDelegate {
    func collectionViewDidSeletClicked(CollectionIndexPath: IndexPath, tableViewIndexPath: IndexPath) {
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        if tableViewIndexPath.section == 0 {
        vc.image = arrOfcollectionViewImages[CollectionIndexPath.item] as NSString
        } else {
             vc.image = images[CollectionIndexPath.item] as NSString
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0 {
            return 1
         } else if section == 1 {
            return 1
         } else if section == 2 {
            return 1
         } else if section == 3 {
            return arrOfvideoNames.count
         } else if section == 4{
            return 0
         } else {
            return 1
        }
        
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.didselectdelegate = self
        cell.tableviewIndex = indexPath
         cell.selectionStyle = .none
        cell.arrOfcollectionViewImages = arrOfcollectionViewImages
        return cell
        } else if indexPath.section == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.selectionStyle = .none
        return cell
       } else if indexPath.section == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TableViewCell2
        cell.delegateobj = self as VideocollectionviewDidSelectDelegate
        cell.selectionStyle = .none
        return cell
       } else if indexPath.section == 3 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! TableViewCell4
        cell.lblOfNames.text = arrOfvideoNames[indexPath.row]
        cell.selectionStyle = .none
        return cell
       } else if indexPath.section == 5{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.didselectdelegate = self
        cell.tableviewIndex = indexPath
        cell.arrOfcollectionViewImages = images
        cell.selectionStyle = .none
        return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
        CGFloat {
             if indexPath.section == 0 {
                return 130
             } else if indexPath.section == 1 {
                return 40
             } else if indexPath.section == 2 {
                return 120
             }else if indexPath.section == 3 {
                return 40
             }else if indexPath.section == 5{
               return 150
             } else {
               return 40
            }
           
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 4 {
            return 50
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 4 {
            let sectionHeader = tableView.dequeueReusableCell(withIdentifier: "header")
            
            return sectionHeader
        }
        return UIView()
    }
    
    
   
    
    func videocollectionViewDidSeletClicked(selectedPath: IndexPath) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
        vc.videoName = videos[selectedPath.item]
        vc.name =  arrOfvideoNames[selectedPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    
  
//     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        if indexPath.section == 0 {
//        guard let tableViewCell = cell as? TableViewCell else { return }
//
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
//        } else if indexPath.section == 2 {
//            guard let tableViewCell = cell as? TableViewCell2 else { return }
//
//            tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
//        }
//    }
//
//     func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//         if indexPath.section == 0 {
//        guard let tableViewCell = cell as? TableViewCell else { return }
//
//        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
//         } else if indexPath.section == 2 {
//            guard let tableViewCell = cell as? TableViewCell else { return }
//
//            storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
//        }
//    }

}


// extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView.tag == 0 {
//        return arrOfcollectionViewImages.count
//        } else {
//        return arrOfvideoNames.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView.tag == 0 {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
//
//        cell.imgView.image = UIImage(named: arrOfcollectionViewImages[indexPath.row])
//        return cell
//         } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! CollectionViewCell2
//            cell.lblOfVideoNames.text = arrOfvideoNames[indexPath.item]
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
//        if collectionView.tag == 0 {
//        let story = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = story.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
//        vc.image = arrOfcollectionViewImages[indexPath.item] as NSString
//        self.navigationController?.pushViewController(vc, animated: true)
//        } else if collectionView.tag == 1 {
//            let story = UIStoryboard.init(name: "Main", bundle: nil)
//            let vc = story.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
//           vc.videoName = videos[indexPath.item]
//           vc.name =  arrOfvideoNames[indexPath.row]
//           self.navigationController?.pushViewController(vc, animated: true)
//
//        }
//
//
//    }
//
//
//
//}

