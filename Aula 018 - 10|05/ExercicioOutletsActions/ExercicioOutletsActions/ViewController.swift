//
//  ViewController.swift
//  ExercicioOutletsActions
//
//  Created by Rodrigo Leme on 05/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var sbBusca: UISearchBar!
    @IBOutlet weak var btnCarregar: UIButton!
    @IBOutlet weak var lblTextoL: UILabel!
    @IBOutlet weak var imvImagem: UIImageView!
    @IBOutlet weak var tfTexto: UITextField!
    
    var arrImage = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sbBusca.placeholder = "Lorem Ipsum"
        lblTitulo.text = "Clique no botão"
        btnCarregar.setTitle("Carregar", for: .normal)
        tfTexto.text = ""
        lblTextoL.text = ""
        
        for n in 0...9 {
            arrImage.append("carro\(n).jpg")
        }
        
    }

    @IBAction func carregar(_ sender: UIButton) {
        let linha = Int(arc4random_uniform(UInt32(arrImage.count)))
        imvImagem.image = UIImage(named: arrImage[linha])
        lblTextoL.text = arrImage[linha]
        tfTexto.text = arrImage[linha]
    }

}

