import UIKit

/*
 Imprimir números aleatórios entre 0 e 5, até que se imprima um 3.
 Ajuda: A função arc4random_uniform(_ n: Int) (definida na biblioteca
 Faundation) retorna um número aleatório entre 0 e o parâmetro,
 exemplo.
 var numero = arc4random_uniform(5)
 */

var numero: Int = 0;

repeat {
    numero = Int(arc4random_uniform(6))
    print("Número: \(numero)")
} while numero != 3
