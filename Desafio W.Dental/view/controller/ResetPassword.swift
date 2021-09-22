//
//  ResetPassword.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 17/09/21.
//

import UIKit

class ResetPassword: UIViewController {
    
    
    @IBOutlet weak var tfSeuCpf: UITextField!
    @IBOutlet weak var btReenviarSenha: UIButton!
    @IBOutlet weak var tfDataNascimento: UITextField!
    @IBOutlet weak var ivDataNascimento: UIImageView!
    @IBOutlet weak var ivVistoSeuCPF: UIImageView!
    @IBOutlet weak var lbDataNascimento: UILabel!
    @IBOutlet weak var lbCpf: UILabel!
    
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        // MARK: - Style Buttons
        btReenviarSenha.layer.cornerRadius = 20.0
        

        
    }
    
    @IBAction func esqueciSenhaFecharCPF(_ sender: UITextField) {

        if tfDataNascimento.text?.isEmpty == false {
                tfDataNascimento.isHidden = false
            }
            else {
                ivDataNascimento.image = UIImage?(nil)
                lbDataNascimento.isHidden = true
            }
        if tfSeuCpf.text?.isEmpty == false {
            lbCpf.isHidden = false
        }
        else {
            ivVistoSeuCPF.image = UIImage?(nil)
            lbCpf.isHidden = true
        }
        
        if let selectedRange = tfSeuCpf.selectedTextRange {

            let cursorPosition = tfSeuCpf.offset(from: tfSeuCpf.beginningOfDocument, to: selectedRange.start)
            
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
            
            tfSeuCpf.text?.append(appendString)
            
            if (tfSeuCpf.text?.count)! == 14{
                tfSeuCpf.isEnabled = false
                tfSeuCpf.isEnabled = true
            }
        }
        
    }
    
    @IBAction func limpaCpf(_ sender: UITextField) {
        
            if tfSeuCpf.text?.isEmpty == false {
                tfSeuCpf.text = nil
            }
    }
    
    
        @IBAction func vistoCPFSenha(_ sender: UITextField) {
    
            if tfSeuCpf.text?.isEmpty == false {
                ivVistoSeuCPF.image = UIImage(named: "ok")
                lbCpf.isHidden = false
            }
    
            if tfDataNascimento.text?.isEmpty == false {
                ivDataNascimento.image = UIImage(named: "ok")
                lbDataNascimento.isHidden = false
            }
        }
}

    
    
