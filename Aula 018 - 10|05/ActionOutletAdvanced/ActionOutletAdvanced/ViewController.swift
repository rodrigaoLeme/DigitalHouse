//
//  ViewController.swift
//  ActionOutletAdvanced
//
//  Created by Rodrigo Leme on 05/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelName: MyLabel!
    @IBOutlet weak var buttonConfirm: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = "Meu Nome"
        buttonConfirm?.setTitle("Clique aqui", for: .normal)
    }
    
    @IBAction func actionButtonConfirm(_ sender: UIButton) {
        print("Pressionou \(sender.title(for: .normal))")
    }


}

