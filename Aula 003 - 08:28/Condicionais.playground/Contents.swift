import UIKit


func cumprimentarA(pessoa: String) {
    print("Olá \(pessoa)");
}

func cumprimentar(a: String) {
    print("Olá \(a)");
}

func cumprimentarA(_ pessoa: String) {
    print("Olá \(pessoa)");
}

cumprimentarA(pessoa: "João");
cumprimentar(a: "João");
cumprimentarA("João");


func eMenor(oPrimeiro: Int, oSegundo: Int) -> Bool {
    return(oPrimeiro < oSegundo);
}

print(eMenor(oPrimeiro: 3, oSegundo: 5));
print(eMenor(oPrimeiro: 3, oSegundo: 4));
print(eMenor(oPrimeiro: 7, oSegundo: 5));
print(eMenor(oPrimeiro: 10, oSegundo: 10));



func eImparMaiorQueDez(umNumero: Int) -> Bool {
    var retorno: Bool = true;
    if (umNumero < 10) {
        retorno = false
    } else {
        if ((umNumero%2) == 0) {
            retorno = false;
        }
    }
    
    return retorno;
}

print("O Número 3 retornou: \(eImparMaiorQueDez(umNumero: 3))");
print("O Número 4 retornou: \(eImparMaiorQueDez(umNumero: 4))");
print("O Número 13 retornou: \(eImparMaiorQueDez(umNumero: 13))");
print("O Número 14 retornou: \(eImparMaiorQueDez(umNumero: 14))");
