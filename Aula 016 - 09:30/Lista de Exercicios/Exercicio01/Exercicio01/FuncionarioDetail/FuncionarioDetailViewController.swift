//
//  FuncionarioDetailViewController.swift
//  Exercicio01
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class FuncionarioDetailViewController: UIViewController {
    @IBOutlet weak var lblNome: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func fechar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
