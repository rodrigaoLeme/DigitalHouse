//
//  FuncionarioCell.swift
//  Exercicio01
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class FuncionarioCell: UITableViewCell {
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblCargo: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUp(pessoa: Funcionario) {
        lblNome.text = pessoa.nome
        lblCargo.text = pessoa.cargo
        lblEmail.text = pessoa.email
    }
}
