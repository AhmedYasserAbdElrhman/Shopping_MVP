//
//  HomeVC.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/2/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
 
class HomeVC: UIViewController {
    
    
    @IBOutlet weak var HomeCV: UICollectionView!
    @IBOutlet weak var ProductCV: UICollectionView!
    var presenter: Presenter!
    var items = [FavProduct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeCV.delegate = self
        HomeCV.dataSource = self
        ProductCV.dataSource = self
        ProductCV.delegate = self
        presenter = Presenter(view: self)
        presenter.ShowCatoragy()
         presenter.ShowProduct()
        HomeCV.transform = CGAffineTransform(scaleX:-1,y: 1)
     }
    
 
    
}
extension HomeVC:getToDos{
    func getFavItems() {
        
    }
    
    func navigate(item: String) {
           performSegue(withIdentifier: "Home", sender: self)


    }
    
    func showHud() {
        startAnimation()
    }
    
    func HideHud() {
        
    }
    
    func getDataSuccessfully() {
        HomeCV.reloadData()
        ProductCV.reloadData()

    }
    
    func showError(error: String) {
        print(error)
    }
    
    
}
extension HomeVC: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == HomeCV{
        return presenter.titlesCount()
        }
        else {
            return presenter.titlesForProductCount()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == HomeCV{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        presenter.reloadTitles(cell: cell, index: indexPath.row)
        presenter.reloadimage(cell: cell, index: indexPath.row)
        cell.titleLBL.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        cell.image.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
         return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
            presenter.reloadProductTitles(cell: cell , index: indexPath.row)
            presenter.reloadCellProudctImage(cell: cell, index: indexPath.row)
            cell.addtocart.tag = indexPath.row
            cell.addtocart.addTarget(self, action: #selector(subscribe(_:)), for: .touchUpInside)

            return cell
        }
    }
    
    
    
    
    
    @objc func subscribe(_ sender: UIButton){
        let param = ["product_id":presenter.getFavItems()[sender.tag].id]
      //  let param = ["product_id":presenter.FavProductitem[sender.tag].id]
        print(param)
     presenter.Fav(param: param)
        
    }

  

    
}
 
 
