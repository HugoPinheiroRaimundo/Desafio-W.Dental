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
    
    
    @IBOutlet weak var ivVistoCPF: UIImageView!
    @IBOutlet weak var ivVistoSenha: UIImageView!
    
    
   
    @IBOutlet weak var lbSenha: UILabel!
    @IBOutlet weak var lbCpf: UILabel!
    
    @IBOutlet weak var btEsqueceuSenha: UIButton!
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
    
        @IBAction func esqueciSenhaFecharCPF(_ sender: UITextField) {
    
            if tfSenha.text?.isEmpty == false {
                btEsqueceuSenha.isHidden = true
                    lbSenha.isHidden = false
                }
                else {
                    btEsqueceuSenha.isHidden = false
                    ivVistoSenha.image = UIImage?(nil)
                    lbSenha.isHidden = true
                }
            if tfSeuCPF.text?.isEmpty == false {
                lbCpf.isHidden = false
            }
            else {
                ivVistoCPF.image = UIImage?(nil)
                lbCpf.isHidden = true
            }
            
            if let selectedRange = tfSeuCPF.selectedTextRange {

                let cursorPosition = tfSeuCPF.offset(from: tfSeuCPF.beginningOfDocument, to: selectedRange.start)
                
                var appendString = ""
                
                switch cursorPosition {
                case 3:
                    appendString = "."
                case 7:
                    appendString = "."
                case 11:
                    appendString = "-"
                default:
                    break
                }
                
                tfSeuCPF.text?.append(appendString)
                
                if (tfSeuCPF.text?.count)! == 14{
                    tfSeuCPF.isEnabled = false
                    tfSeuCPF.isEnabled = true
                }
            }
            
        }
    
    
    
    @IBAction func limpaCpf(_ sender: UITextField) {
        
            if tfSeuCPF.text?.isEmpty == false {
                tfSeuCPF.text = nil
            }
    }
    
    
        @IBAction func vistoCPFSenha(_ sender: UITextField) {
    
            if tfSeuCPF.text?.isEmpty == false {
                ivVistoCPF.image = UIImage(named: "ok")
                lbCpf.isHidden = false
            }
    
            if tfSenha.text?.isEmpty == false {
                ivVistoSenha.image = UIImage(named: "ok")
                lbSenha.isHidden = false
            }
        }
}

