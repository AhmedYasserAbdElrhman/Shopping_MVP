//
//  ProductCollectionViewCell.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/2/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import Kingfisher
class ProductCollectionViewCell: UICollectionViewCell,reloadCellProudctImage,reloadCelProudctlTitles {
    
    
    
    @IBOutlet weak var View: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var addtocart: UIButton!
    override func awakeFromNib() {
           super.awakeFromNib()
           UI()
        addtocart.layer.borderColor = #colorLiteral(red: 0.4861215353, green: 0.7715842128, blue: 0.08736038953, alpha: 1)
        addtocart.layer.cornerRadius = 3
        addtocart.layer.cornerRadius = 10
        addtocart.layer.borderWidth = 1

        }
    
    func reloadProductTitle(title: String) {
        titlee.text = title
        
    }
    func reloadProductImage(image: ProductModelDatum) {
        if let img = URL(string: image.image ?? ""){
            DispatchQueue.main.async {
                
                self.image.kf.setImage(with: img)
                
            }
            
        }
    }
    
    func UI() {
        View.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        View.layer.cornerRadius = 3.0
        View.layer.masksToBounds = false
        View.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        View.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        View.layer.shadowOpacity = 0.8
        
    }

    
}
