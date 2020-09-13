import UIKit

/*
 1. Imprima na tela a soma dos primeiros dez números naturais ÍMPARES
 elevados ao quadrado
 */

var totalDeNumeros: Int = 0;
var numeroTestado: Int = 0;
var resultado: Int = 0;

while totalDeNumeros < 10 {
    var continuaTestando: Bool = true;
    
    while continuaTestando {
        if (numeroTestado % 2 != 0) {
            totalDeNumeros += 1;
            resultado = resultado + (numeroTestado * numeroTestado);
            print("\(totalDeNumeros)) Número: \(numeroTestado) - ao quadarado = \(numeroTestado * numeroTestado)")
            continuaTestando = false
        }
        numeroTestado += 1;
    }
}

print(resultado)
