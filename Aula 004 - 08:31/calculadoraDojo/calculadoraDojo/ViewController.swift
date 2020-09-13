//
//  ViewController.swift
//  calculadoraDojo
//
//  Created by Rodrigo Leme on 31/08/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets dos componentes da tela
    @IBOutlet weak var lblResultado: UILabel!
    
    //numeros
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    //operações
    @IBOutlet weak var btnMais: UIButton!
    @IBOutlet weak var btnMenos: UIButton!
    @IBOutlet weak var btnMultiplicacao: UIButton!
    @IBOutlet weak var btnDivisao: UIButton!
    @IBOutlet weak var btnPorcentagem: UIButton!
    @IBOutlet weak var btnMaisMenos: UIButton!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnIgual: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    
    
    // Variaveis
    var aux: Int = 0;
    var aux2: Int?;
    var operation: Int = 0
    var mantemDisplay: Bool = true;
    var travaOperacao: Bool = false;
    
    override func viewDidLoad() {
        lblResultado.text = "0";
        arredondaBotoes();
    }

    
    @IBAction func digitaNumero(_ sender: UIButton) {
        // limpando estilos dos botões
        limpaBotoes()
        travaOperacao = false
        
        if (mantemDisplay == false) {
            lblResultado.text = "0";
            mantemDisplay = true
        }
        
        if let valor = lblResultado.text {
            if (lblResultado.text == "0") {
                if (sender.tag != 0) {
                    lblResultado.text = String(sender.tag)
                    aux = Int(lblResultado.text!)!
                }
            } else {
                lblResultado.text = valor + String(sender.tag)
                aux = Int(lblResultado.text!)!
            }
        }
     
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        lblResultado.text = "0"
        aux = 0;
        aux2 = nil;
        operation = 0;
    }
    
    @IBAction func operacoes(_ sender: UIButton) {
        // limpando estilos dos botões
        limpaBotoes()
        
        // alterando estilo do botao selecionado
        sender.layer.backgroundColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1).cgColor
        sender.setTitleColor(.black, for: .normal)
        
        btnIgual.tag = sender.tag
        
        if (aux2 == nil) {
            aux2 = aux;
            mantemDisplay = false;
            operation = sender.tag
        } else {
            if (!travaOperacao) {
                resultado(sender)
            } else {
                operation = sender.tag
            }
        }
    }
    
    
    @IBAction func resultado(_ sender: UIButton) {
        var resultado: Int = 0;
        
        if (operation == 1) {
            resultado = aux2! + aux
        } else if (operation == 2) {
            resultado = aux2! - aux
        } else if (operation == 3) {
            resultado = aux2! * aux
        } else if (operation == 4){
            resultado = aux2! / aux
        }
        
        
        aux2 = resultado
        lblResultado.text = String(resultado);
        mantemDisplay = false;
        operation = sender.tag;
        travaOperacao = true;
    }
    
    func limpaBotoes() {
        // resetando os estilos de todos os botoes
        btnMais.backgroundColor = UIColor(displayP3Red: 253/255, green: 140/255, blue: 47/255, alpha: 1);
        btnMais.setTitleColor(.white, for: .normal)
        
        btnMenos.backgroundColor = UIColor(displayP3Red: 253/255, green: 140/255, blue: 47/255, alpha: 1);
        btnMenos.setTitleColor(.white, for: .normal)
        
        btnMultiplicacao.backgroundColor = UIColor(displayP3Red: 253/255, green: 140/255, blue: 47/255, alpha: 1);
        btnMultiplicacao.setTitleColor(.white, for: .normal)
        
        btnDivisao.backgroundColor = UIColor(displayP3Red: 253/255, green: 140/255, blue: 47/255, alpha: 1);
        btnDivisao.setTitleColor(.white, for: .normal)
    }
    
    func arredondaBotoes() {
        btn0.layer.cornerRadius = btn0.frame.size.height/2
        btn1.layer.cornerRadius = btn1.frame.size.height/2
        btn2.layer.cornerRadius = btn2.frame.size.height/2
        btn3.layer.cornerRadius = btn3.frame.size.height/2
        btn4.layer.cornerRadius = btn4.frame.size.height/2
        btn5.layer.cornerRadius = btn5.frame.size.height/2
        btn6.layer.cornerRadius = btn6.frame.size.height/2
        btn7.layer.cornerRadius = btn7.frame.size.height/2
        btn8.layer.cornerRadius = btn8.frame.size.height/2
        btn9.layer.cornerRadius = btn9.frame.size.height/2
        
        // os demais botões eu arrendodei no storyboard na aba Identity Inspector - User Defined Runtime Attributes
    }
}


