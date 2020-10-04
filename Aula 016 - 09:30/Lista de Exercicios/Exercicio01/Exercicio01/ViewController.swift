//
//  ViewController.swift
//  Exercicio01
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tbvLista: UITableView!
    
    var arrayFuncionario = [Funcionario]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tbvLista.delegate = self
        tbvLista.dataSource = self
        
        arrayFuncionario.append(Funcionario(nome: "Rodrigo", cargo: "Bartender", email: "rodrigo@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "José", cargo: "Pedreiro", email: "jose@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "João", cargo: "Pintor", email: "joao@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Marco", cargo: "Frentista", email: "marco@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Bonifácio", cargo: "Vendedor", email: "bonifacio@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Augusto", cargo: "Empresário", email: "augusto@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Florisvaldo", cargo: "Motorista", email: "florisvaldo@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Elisa", cargo: "Modelo", email: "elisa@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Hugo", cargo: "Gerente", email: "hugo@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Matilda", cargo: "Garçonete", email: "matilda@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Carolina", cargo: "Jornalista", email: "carolina@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Leila", cargo: "Fotógrafa", email: "leila@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Paula", cargo: "RH", email: "paula@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Lana", cargo: "Estudante", email: "lana@gmail.com"))
        arrayFuncionario.append(Funcionario(nome: "Luis", cargo: "Músico", email: "luis@gmail.com"))
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let funcionarioDetail = UIStoryboard(name: "FuncionarioDetail", bundle: nil).instantiateInitialViewController() as? FuncionarioDetailViewController {
            present(funcionarioDetail, animated: true, completion: nil)
        funcionarioDetail.lblNome.text = arrayFuncionario[indexPath.row].nome
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFuncionario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvLista.dequeueReusableCell(withIdentifier: "FuncionarioCell") as! FuncionarioCell
        
        cell.setUp(pessoa: arrayFuncionario[indexPath.row])
        
        return cell
    }
    
    
}
