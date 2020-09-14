//
//  ViewController.swift
//  DesafaioEmailSenha
//
//  Created by Rodrigo Leme on 14/09/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class Usuario {
    var email: String!
    var senha: String!
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var buttonCadastrar: UIButton!
    var user: Usuario?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmail.delegate = self
        textFieldSenha.delegate = self
        
    }
    
    private func validaInformacoes() -> Bool {
        if textFieldEmail.text == nil || textFieldEmail.text!.isEmpty {
            textFieldEmail.becomeFirstResponder()
            return false
        }
        
        if textFieldSenha.text == nil || textFieldSenha.text!.isEmpty {
            textFieldSenha.becomeFirstResponder()
            return false
        }
        
        buttonCadastrar.isEnabled = true
        
        return true
    }
    
    @IBAction func cadastrar(_ sender: UIButton) {
        if (user == nil) {
            user = .init(email: textFieldEmail.text!, senha: textFieldSenha.text!)
            textFieldEmail.text = "";
            textFieldSenha.text = "";
        } else {
            if textFieldSenha.text! == user!.email && textFieldSenha.text! == user!.senha {
                view.backgroundColor = UIColor.red
            } else {
                view.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
            }
        }
    }
    

}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            textFieldSenha.becomeFirstResponder()
        } else if textField == textFieldSenha {
            if validaInformacoes() {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
}

