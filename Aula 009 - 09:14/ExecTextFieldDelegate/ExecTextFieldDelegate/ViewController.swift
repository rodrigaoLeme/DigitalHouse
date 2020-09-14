//
//  ViewController.swift
//  ExecTextFieldDelegate
//
//  Created by Rodrigo Leme on 14/09/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldCargo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldNome.delegate = self
        textFieldCargo.delegate = self
    }

    private func validaInformacoes() -> Bool{
        if textFieldNome.text == nil || textFieldNome.text!.isEmpty {
            print("Falta o Nome")
            textFieldNome.becomeFirstResponder()
            return false
        }
        
        if textFieldCargo.text == nil || textFieldCargo.text!.isEmpty {
            print("Falta o Cargo")
            textFieldCargo.becomeFirstResponder()
            return false
        }
        
        return true
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textFieldNome.isFirstResponder {
            textFieldCargo.becomeFirstResponder()
        } else if textFieldCargo.isFirstResponder {
            if validaInformacoes() {
                textField.resignFirstResponder()
            } else {
                
            }
        }
        
        
        
//        print("textFieldShouldReturn")
//        if let texto = textField.text {
//            print(texto)
//        }
        
        return true
    }
}
