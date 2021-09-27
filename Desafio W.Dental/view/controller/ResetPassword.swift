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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Injection
    let viewModel = RecoverPasswordViewModel(dataService: DataService())
    let service = DataService()
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
      
        // MARK: - Style Buttons
        btReenviarSenha.layer.cornerRadius = 20.0
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Networking
    
    private func attemptFetchRecover(withId id: Int) {
        viewModel.fetchReset(withId: id)
          
          viewModel.updateLoadingStatus = {
              let _ = self.viewModel.isLoading ? self.activityIndicatorStart() : self.activityIndicatorStop()
          }
          
          viewModel.showAlertClosure = {
              if let error = self.viewModel.error {
                  print(error.localizedDescription)
              }
          }
          
          viewModel.didFinishFetch = {
            print(self.viewModel.userID!)
            print(self.viewModel.title!)
          
          
          }
    }
    
    // MARK: - UI Setup
    private func activityIndicatorStart() {
        activityIndicator.startAnimating()
        print("start")
    }
    
    private func activityIndicatorStop() {
        performSegue(withIdentifier: "successfulSegue3", sender: nil)
        print("stop")
    }
    
    
    
    @IBAction func actionLogin(_ sender: UIButton) {
        attemptFetchRecover(withId: 2)
    }
    
    
    
    @IBAction func changedTextFields(_ sender: UITextField) {
        
        if  tfSeuCpf.text?.isEmpty == false {
            lbCpf.isHidden = false
        }else{
            lbCpf.isHidden = true
        }
        
        if  tfDataNascimento.text?.isEmpty == false {
            lbDataNascimento.isHidden = false
        }else{
            lbDataNascimento.isHidden = true
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
                ivVistoSeuCPF.image = UIImage(named: "ok")
                lbCpf.isHidden = false
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
                ivDataNascimento.image = UIImage(named: "ok")
                lbDataNascimento.isHidden = false
            }
        }
    }
    
    @IBAction func didEndTextFields(_ sender: UITextField) {
        if (tfSeuCpf.text?.isEmpty == true) || (tfDataNascimento.text?.isEmpty == true){
            btReenviarSenha.isEnabled = false
        }else{
            btReenviarSenha.isEnabled = true
        }
        
    }

    @IBAction func didBeginDate(_ sender: UITextField) {
        if  tfDataNascimento.text?.isEmpty == false {
            tfDataNascimento.text = nil
            ivDataNascimento.image = UIImage?(nil)
            lbDataNascimento.isHidden = true
        }
    }

    @IBAction func didBeginCpf(_ sender: UITextField) {
        if  tfSeuCpf.text?.isEmpty == false {
            tfSeuCpf.text = nil
            ivVistoSeuCPF.image = UIImage?(nil)
            lbCpf.isHidden = true
        }
    }

    

}
