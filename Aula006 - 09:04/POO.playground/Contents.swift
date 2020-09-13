import UIKit

class Mamifero {
    // Atributos
    var nome: String
    var tamanho: Double
    var peso: Double
    var cor: String
    var dataNascimento: String
    
    init(nome: String, tamanho: Double, raca: String, peso: Double, cor: String, dataNascimento: String) {
        self.nome = nome;
        self.tamanho = tamanho;
        self.peso = peso;
        self.cor = cor;
        self.dataNascimento = dataNascimento;
    }
    
    func brinca(){
        print("Se Diverte")
    }
    
    func pula(){
        print("Sai do chão")
    }
    
    func dorme(){
        print("zzzzzzzz")
    }
    
    func come(){
        print("fica alimentado")
    }
}

class Cachorro: Mamifero {
    // Atributos
    var raca: String
    
    override init(nome: String, tamanho: Double, raca: String, peso: Double, cor: String, dataNascimento: String) {
        self.raca = raca
        super.init(nome: nome, tamanho: tamanho, raca: raca, peso: peso, cor: cor, dataNascimento: dataNascimento)
    }
    
    // Faz: Methods, Funcs, Ações
    func late() {
        print("AuAu")
    }
}

class Gato: Mamifero {
    var raca: String
    
    override init(nome: String, tamanho: Double, raca: String, peso: Double, cor: String, dataNascimento: String) {
        self.raca = raca
        super.init(nome: nome, tamanho: tamanho, raca: raca, peso: peso, cor: cor, dataNascimento: dataNascimento)
    }
    
    func mia(){
        print("Miau");
    }
}



let ice = Cachorro(nome: "Ice", tamanho: 10, raca: "Labrador", peso: 30, cor: "Caramelo", dataNascimento: "01/01/2018")

print(ice.nome);
print(ice.tamanho);
ice.late()
ice.brinca()

print("\n---------------------\n")

let tonny = Gato(nome: "tony", tamanho: 2, raca: "SRD", peso: 2, cor: "Preto", dataNascimento: "02/02/2019");
print(tonny.nome);
print(tonny.tamanho);
tonny.mia()
tonny.brinca()




/*
 Herança
 Restaurante, Mercado e Afins, Qualquer Coisa: Estabelecimento

 Classes


 Atributos

 Categorias: [Mercados & Afins, Restaurantes, Qualquer Coisa]
 Produto(frete: Double, Nome: String, tempoDeEntrega: Date, imagem: String, tipoProduto: String, valorProduto: Double)
 Categoria(nomeCategoria: String, produtos: [Produtos], descrição: String)
 Categoria(localidade: String)
 Restaurantes: [Restaurante]
 Promoções: [Produto]
 Restaurante e Mercado: Estabelecimento
 Herança
 
*/
