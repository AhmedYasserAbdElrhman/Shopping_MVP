//
//  CollectionViewCell.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/2/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell,reloadCellTitles,reloadCellImage {
 
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    func reloadTitle(title: String) {
        titleLBL.text = title
    }
    func reloadImage(image: Datum) {
        if let img = URL(string: image.image ?? ""){
                  DispatchQueue.main.async {

                          self.image.kf.setImage(with: img)
                             
                         }
               
          }

    }
    

}
 
