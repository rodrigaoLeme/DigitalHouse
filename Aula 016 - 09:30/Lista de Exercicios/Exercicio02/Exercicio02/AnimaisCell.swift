//
//  AnimaisCell.swift
//  Exercicio02
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class AnimaisCell: UITableViewCell {
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblRaca: UILabel!
    @IBOutlet weak var lblPeso: UILabel!
    @IBOutlet weak var lblEspecie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(animal: Animais) {
        lblNome.text = animal.nome
        lblRaca.text = animal.raca
        lblPeso.text = String(animal.peso)
        lblEspecie.text = animal.especie
    }

}
