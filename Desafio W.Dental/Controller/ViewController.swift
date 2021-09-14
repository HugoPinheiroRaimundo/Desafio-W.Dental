//
//  ViewController.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 13/09/21.
//

import UIKit

class ViewController: UIViewController {
    
   // MARK: - IBOutlet
    
    
    @IBOutlet weak var tfSeuCPF: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var btPrimeiroAcesso: UIButton!
    @IBOutlet weak var btContrateAgora: UIButton!
    
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        // MARK: - Style Buttons
        btEntrar.layer.cornerRadius = 20.0
        
        btPrimeiroAcesso.layer.cornerRadius = 10.0
        btPrimeiroAcesso.layer.borderWidth = 1
        btPrimeiroAcesso.layer.borderColor = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 1.00).cgColor
        
        
        btContrateAgora.layer.cornerRadius = 10.0
        btContrateAgora.layer.borderWidth = 1
        btContrateAgora.layer.borderColor = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 1.00).cgColor
     

    // MARK: - Style TextField
        tfSenha.layer.borderColor = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.00).cgColor
        tfSenha.layer.masksToBounds = true
        tfSenha.layer.cornerRadius = 3.0
        
      
        tfSeuCPF.layer.borderColor = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.00).cgColor
        tfSeuCPF.layer.masksToBounds = true
        tfSeuCPF.layer.cornerRadius = 3.0

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
    

}

