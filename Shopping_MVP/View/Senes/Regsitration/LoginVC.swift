//
//  ViewController.swift
//  Shopping_MVP
//
//  Created by Hany Karam on 7/1/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SigininButton: UIButton!
    @IBOutlet weak var HomeScreen: UIButton!
    
    var presenter: Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(view: self)
        SigininButton.layer.borderColor = #colorLiteral(red: 0.9139490724, green: 0.824175179, blue: 0.07385125011, alpha: 1)
        SigininButton.layer.cornerRadius = 5
        SigininButton.layer.cornerRadius = 10
        SigininButton.layer.borderWidth = 6
        
        HomeScreen.layer.borderColor = #colorLiteral(red: 0.4861215353, green: 0.7715842128, blue: 0.08736038953, alpha: 1)
        HomeScreen.layer.cornerRadius = 3
        HomeScreen.layer.cornerRadius = 10
        HomeScreen.layer.borderWidth = 1
        
        
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        let param = ["email":NameTextField.text ?? "",
                     "password":PasswordTextField.text ?? ""]
        presenter = Presenter(view: self)
        
        presenter.login(param: param)
        
    }
    
    
}

extension LoginVC:getToDos{
    var idsArray: [Int] {
        <#code#>
    }
    
    func getFavItems() {
        
    }
    
  
    
    func navigate(item: String) {
        
    }
    
    func showHud() {
        startAnimation()
    }
    
    func HideHud() {
        
    }
    
    func getDataSuccessfully() {
        
    }
    
    func showError(error: String) {
        print(error)
    }
    
}
