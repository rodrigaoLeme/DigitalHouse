import UIKit

public class Carro {
    private var modelo : String
    private var ano : Int?
    
    init(modelo: String) {
        self.modelo = modelo
    }
    
//    func getAno() -> Int {
//        if let anoQueNaoENil = ano {
//            return anoQueNaoENil
//        }
//        return 0
//        // return ano ?? 0 nil-coalescing é tipo um ternário
//    }
    
    func getAno() -> Int? {
        return ano
    }
    
    func setAno(ano: Int) {
        if ano > 0 {
           self.ano = ano
        } else {
            self.ano = nil;
        }
    }
    
    func getModelo() -> String {
        return modelo
    }
    
    func setModelo(modelo: String) {
        self.modelo = modelo;
    }
}

let onix = Carro(modelo: "Chevrolé");
onix.getModelo()
onix.setModelo(modelo: "Chevrolet");
onix.getModelo()

print(onix.getAno())

if onix.getAno() == nil {
    print("Não tem ano setado. Setando ano para 2020...")
    onix.setAno(ano: 2020)
    print(onix.getAno())
}

print("Não tem ano setado. Setando ano para -10...")
onix.setAno(ano: -10)

print(onix.getAno())
