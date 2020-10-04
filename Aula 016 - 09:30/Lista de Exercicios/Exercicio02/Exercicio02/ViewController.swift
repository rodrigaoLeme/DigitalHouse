//
//  ViewController.swift
//  Exercicio02
//
//  Created by Rodrigo Leme on 04/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tbvLista: UITableView!
    
    var arrayAnimais = [Animais]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvLista.delegate = self
        tbvLista.dataSource = self
        
        for n in 1...10 {
            arrayAnimais.append(Animais(nome: "Animal \(n)", raca: "Raca \(n)", peso: Double(n), especie: "Espécie \(n)"))
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let animalView = UIStoryboard(name: "Animal", bundle: nil).instantiateInitialViewController() as? AnimalViewController {
            
            present(animalView, animated: true, completion: nil)
            
            animalView.txtNome.text = arrayAnimais[indexPath.row].nome
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayAnimais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimaisCell") as! AnimaisCell
        
        cell.setUp(animal: arrayAnimais[indexPath.row])
        
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    
}
