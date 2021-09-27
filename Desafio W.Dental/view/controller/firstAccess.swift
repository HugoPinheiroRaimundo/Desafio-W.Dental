//
//  firstAccess.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 16/09/21.
//

import UIKit


class FirstAcess: UIViewController {
 
    @IBOutlet weak var tfSeuCpf: UITextField!
    @IBOutlet weak var tfDataNascimento: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfConfirmeEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    @IBOutlet weak var tfConfirmaSenha: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    
    
    @IBOutlet weak var lbSeuCpf: UILabel!
    @IBOutlet weak var lbDataNascimento: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbConfirmeEmail: UILabel!
    @IBOutlet weak var lbSenha: UILabel!
    @IBOutlet weak var lbConfirmeSenha: UILabel!
    
    
    @IBOutlet weak var ivDataNascimento: UIImageView!
    @IBOutlet weak var ivSeuCpf: UIImageView!
    @IBOutlet weak var ivEmail: UIImageView!
    @IBOutlet weak var ivConfirmeEmail: UIImageView!
    @IBOutlet weak var ivSenha: UIImageView!
    @IBOutlet weak var ivConfirmeSenha: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    // MARK: - Injection
    let viewModel = RegisterViewModel(dataService: DataService())
    let service = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
      
        //MARK: - Style Buttons
        btCadastrar.layer.cornerRadius = 20.0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }

    // MARK: - Networking
    
    private func attempFeatchRegister(withId id: Int) {
        
        viewModel.fetchRegister(withId: id)
        
        viewModel.updateLoadingStatus = {
            let _ = self.viewModel.isLoading ? self.activityIndicatorStart() : self.activityIndicatorStop()
        }
        viewModel.showAlertClosure = {
            if let error = self.viewModel.error {
            print(error.localizedDescription)
                    }
                 }
        viewModel.didFinishFetch = {
            print(self.viewModel.name!)
            print(self.viewModel.email!)
            print(self.viewModel.body!)
        }
    }

    // MARK: - UI Setup
    private func activityIndicatorStart() {
        activityIndicator.startAnimating()
        print("start")
    }
    
    private func activityIndicatorStop() {
        performSegue(withIdentifier: "successfulSegue2", sender: nil)
        print("stop")
    }
    
    
    @IBAction func actionLogin(_ sender: UIButton) {
        attempFeatchRegister(withId: 1)
    }
    
    
    @IBAction func changedTextFields(_ sender: UITextField) {
            
            if  tfSeuCpf.text?.isEmpty == false {
                lbSeuCpf.isHidden = false
            }else{
                ivSeuCpf.image = UIImage?(nil)
                lbSeuCpf.isHidden = true
            }
            
            if  tfDataNascimento.text?.isEmpty == false {
                lbDataNascimento.isHidden = false
            }else{
                ivDataNascimento.image = UIImage?(nil)
                lbDataNascimento.isHidden = true
            }
            
            if  tfEmail.text?.isEmpty == false {
                lbEmail.isHidden = false
            }else{
                ivEmail.image = UIImage?(nil)
                lbEmail.isHidden = true
            }
            
            if  tfConfirmeEmail.text?.isEmpty == false {
                lbConfirmeEmail.isHidden = false
            }else{
                ivConfirmeEmail.image = UIImage?(nil)
                lbConfirmeEmail.isHidden = true
            }
            
            if  tfSenha.text?.isEmpty == false {
                lbSenha.isHidden = false
            }else{
                ivSenha.image = UIImage?(nil)
                lbSenha.isHidden = true
            }
            
            if  tfConfirmaSenha.text?.isEmpty == false {
                lbConfirmeSenha.isHidden = false
            }else{
                ivConfirmeSenha.image = UIImage?(nil)
                lbConfirmeSenha.isHidden = true
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
        
        if let selectedRange2 = tfDataNascimento.selectedTextRange {

                    let cursorPosition = tfDataNascimento.offset(from: tfDataNascimento.beginningOfDocument, to: selectedRange2.start)
                    
                    var appendString = ""

                    switch cursorPosition {
                    case 2:
                        appendString = "/"
                    case 5:
                        appendString = "/"
                    default:
                        break
                    }

                    tfDataNascimento.text?.append(appendString)

                    if (tfDataNascimento.text?.count)! == 10{
                        tfDataNascimento.isEnabled = false
                        tfDataNascimento.isEnabled = true
                    }
                }
            }
        
    @IBAction func beginCPF(_ sender: UITextField) {
        
            if tfSeuCpf.text?.isEmpty == false {
                tfSeuCpf.text = nil
            }
    }
        
    @IBAction func beginDataAniversario(_ sender: UITextField) {
            
                if tfDataNascimento.text?.isEmpty == false {
                    tfDataNascimento.text = nil
        }
        
    }

        @IBAction func vistoTodosEnd(_ sender: UITextField) {
    
            if tfSeuCpf.text?.isEmpty == false {
                ivSeuCpf.image = UIImage(named: "ok")
                lbSeuCpf.isHidden = false
            }
    
            if tfDataNascimento.text?.isEmpty == false {
                ivDataNascimento.image = UIImage(named: "ok")
                lbDataNascimento.isHidden = false
            }
            
            if tfEmail.text?.isEmpty == false {
                ivEmail.image = UIImage(named: "ok")
                lbEmail.isHidden = false
            }
            
            if tfConfirmeEmail.text?.isEmpty == false {
                ivConfirmeEmail.image = UIImage(named: "ok")
                lbConfirmeEmail.isHidden = false
            }
            
            if tfSenha.text?.isEmpty == false {
                ivSenha.image = UIImage(named: "ok")
                lbSenha.isHidden = false
        }
            
            if tfConfirmaSenha.text?.isEmpty == false {
                ivConfirmeSenha.image = UIImage(named: "ok")
                lbConfirmeSenha.isHidden = false

    
            }

    }

}

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
    
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
