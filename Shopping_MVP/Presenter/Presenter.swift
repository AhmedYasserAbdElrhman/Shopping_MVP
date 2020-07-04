//
//  Presenter.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/1/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
protocol getToDos {
    func showHud()
    func HideHud()
    func getDataSuccessfully()
    func showError(error: String)
    var idsArray: [Int] {get}

 }
protocol reloadCellTitles {
    func reloadTitle(title: String)
}
protocol reloadCellImage {
    func reloadImage(image: Datum)
}
protocol reloadCelProudctlTitles {
    func reloadProductTitle(title: String)
}
protocol reloadCellProudctImage {
    func reloadProductImage(image: ProductModelDatum)
}

class Presenter {
    private var view: getToDos?
    private var toDoIndicator = ToDoIndicator()
    private var loginModel:LoginModel?
    private var registerModel:RegisterModel?
    private var catoragt = [Datum]()
    private var product = [ProductModelDatum]()
    public var FavProductitem = [FavProduct]()
 
    
    init(view: getToDos) {
        self.view = view
    }
   
    func login(param:[String:Any]){
        view?.showHud()
        toDoIndicator.Login(userInfoDict:param){ [weak self] (response, error) in
            print(response ?? "")
            if error != nil{
                self?.showToast(message: response?.message ?? "")
                
                print(error ?? "")
                return
            }
            self?.showToast(message: response?.message ?? "")
            
            guard let response = response.self else {return}
            self?.loginModel = response
            
            self?.view?.getDataSuccessfully()
        }
    }
    func ShowCatoragy(){
        view?.showHud()
        toDoIndicator.sendRequest(method: .get, url: categories,completion:
            
            {(err,response: HomeModel?) in
                if err == nil{
                    guard let data = response?.data?.data else{return}
                    self.catoragt = data.self
                    print(response ?? "")
                    print(self.catoragt.count)
                    self.view?.getDataSuccessfully()
                    
                }
        })
    }
    func ShowProduct(){
        view?.showHud()
        toDoIndicator.sendRequest(method: .get, url:"https://student.valuxapps.com/api/products?category_id=4",completion:
            
            {(err,response: ProductModel?) in
                if err == nil{
                    guard let data = response?.data?.data else{return}
                    self.product = data.self
                    print(response ?? "")
                    print(self.product.count)
                    self.view?.getDataSuccessfully()
                    
                }
        })
    }
    //0DiV3plGozqWd8T7Wm4pP9q2vQxT8JCHp55qhSF9aCPGRqMQKH5twUW4ypUMKLJE8cqow8
    func Fav(param:[String:Any]){
        view?.showHud()
        toDoIndicator.AddToFav(userInfoDict:param){ [weak self] (response, error) in
            print(response ?? "")
            if error != nil{
                self?.showToast(message: response?.message ?? "")
                
                print(error ?? "")
                return
            }
            self?.showToast(message: response?.message ?? "")
            
            guard let response = response?.data?.product else {return}
            self?.FavProductitem = [response]
            
            self?.view?.getDataSuccessfully()
        }
    }
    
    
    func titlesCount() -> Int{
        return catoragt.count
    }
    func titlesForProductCount() -> Int{
        return product.count
    }
    /* func produt() -> ProductModelDatum? {
     return produt()
     }*/
    
    func reloadTitles(cell: reloadCellTitles, index: Int){
        cell.reloadTitle(title: catoragt[index].name ?? "")
        
    }
    func reloadimage(cell: reloadCellImage, index: Int){
        cell.reloadImage(image: catoragt[index])
    }
    
    func reloadProductTitles(cell: reloadCelProudctlTitles, index: Int){
        cell.reloadProductTitle(title: product[index].name ?? "")
        
    }
    func reloadCellProudctImage(cell: reloadCellProudctImage, index: Int){
        cell.reloadProductImage(image: product[index])
    }
    
    func getFavItems() -> [FavProduct] {
        return FavProductitem
    }
    
    
    
    
}
extension Presenter {
    
    func showToast(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 90 ) - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 3.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
            
            
            
        }
    }
    
}
