//
//  Animais.swift
//  Exercicio02
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import Foundation

class Animais {
    var nome: String
    var raca: String
    var peso: Double
    var especie: String
    
    init(nome: String, raca: String, peso: Double, especie: String) {
        self.nome = nome
        self.raca = raca
        self.peso = peso
        self.especie = especie
    }
}
