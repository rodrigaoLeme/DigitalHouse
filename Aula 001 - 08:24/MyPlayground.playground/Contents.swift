import UIKit


var peso: Float = 110;
var altura: Float = 1.90;

var imc: Float = peso / (altura * altura);
var imc2 = Float(round(100 * imc)/100)

print("O seu IMC é \(imc2) kg/m2");

var nome: String = "Rodrigo";
var sobrenome: String = "Leme";

var nomeCompletoBR: String = nome + " " + sobrenome;
var nomeCompletoUS: String = sobrenome + ", " + nome;

print(nomeCompletoBR)
print(nomeCompletoUS)
