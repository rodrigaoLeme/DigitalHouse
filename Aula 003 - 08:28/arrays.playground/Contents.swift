import UIKit

var arrayNames = [String]()
arrayNames.append("João");
arrayNames.append("Maria");
arrayNames.append("Pedro");
arrayNames.append("Marta");
arrayNames.append("José");

for index in 1...4 {
    print(index)
}

for letra in ["A", "B", "C"] {
    print(letra)
}


var aurelio = [String: String]()

aurelio["array"] = "Lista de Dados"
aurelio["dicionario"] = "Lista chave e valor"

print(aurelio["array"]!);
