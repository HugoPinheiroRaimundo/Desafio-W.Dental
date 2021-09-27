//
//  ConfirmPassword.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 24/09/21.
//

import UIKit

class ConfirmPassword: UIViewController {
    
    
    @IBOutlet weak var btHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btHome.layer.borderColor = UIColor(red: 0.07, green: 0.10, blue: 0.24, alpha: 1.00).cgColor
        btHome.layer.borderWidth = 1
        btHome.layer.cornerRadius = 20
    }
    
}
