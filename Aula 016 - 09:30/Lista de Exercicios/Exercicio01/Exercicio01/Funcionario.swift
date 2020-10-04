//
//  Funcionario.swift
//  Exercicio01
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import Foundation

class Funcionario {
    var nome: String
    var cargo: String
    var email: String
    
    init (nome: String, cargo: String, email: String) {
        self.nome = nome
        self.cargo = cargo
        self.email = email
    }
}
