import UIKit

class Produto {
    var nome: String
    var preco: Double
    var quantidadeParaDesconto: Int
    var valorDesconto: Double
    
    init(nome: String, preco: Double, quantidadeParaDesconto: Int, valorDesconto: Double) {
        self.nome = nome
        self.preco = preco
        self.quantidadeParaDesconto = quantidadeParaDesconto
        self.valorDesconto = valorDesconto
    }
}

class Vendedor {
    var nome: String
    var idade: Int
    var cpf: String
    private var saldoEmConta : Double
    
    init(nome: String, idade: Int, cpf: String, saldoEmConta: Double) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    
    func vender(quantidadeDePecas: Int, produto: Produto) {
        if produto.nome == "terno" {
            venderTerno(quantidadeDePecas: quantidadeDePecas, produto: produto)
        } else if produto.nome == "vestido" {
            venderVestido(quantidadeDePecas: quantidadeDePecas, produto: produto)
        } else if produto.nome == "boné" {
            venderBone(quantidadeDePecas: quantidadeDePecas, produto: produto)
        } else {
            venderProduto(quantidadeDePecas: quantidadeDePecas, produto: produto)
        }
    }
    
    private func venderTerno(quantidadeDePecas: Int, produto: Produto) {
        // operador ternário: caso a quantidadeDePecas >= produto.quantidadeParaDesconto a variavel precoTerno recebe(?) o produto.valorDesconto. Caso contrário(:) recebe produto.preco
        let precoTerno = (quantidadeDePecas >= produto.quantidadeParaDesconto) ? produto.valorDesconto : produto.preco
        
        // atualizando Saldo em Conta
        saldoEmConta = saldoEmConta + (Double(quantidadeDePecas) * precoTerno)
    }
    
    private func venderVestido(quantidadeDePecas: Int, produto: Produto) {
        let conta = Double(quantidadeDePecas) * produto.preco
        saldoEmConta = (quantidadeDePecas >= produto.quantidadeParaDesconto) ? saldoEmConta + (conta - produto.valorDesconto) : saldoEmConta + conta
    }
    
    private func venderBone(quantidadeDePecas: Int, produto: Produto) {
        let brinde = quantidadeDePecas / produto.quantidadeParaDesconto
        saldoEmConta = saldoEmConta + (Double(quantidadeDePecas) * produto.preco) - (Double(brinde) * produto.valorDesconto)
    }
    
    private func venderProduto(quantidadeDePecas: Int, produto: Produto) {
        saldoEmConta = saldoEmConta + (Double(quantidadeDePecas) * produto.preco)
    }
    
    func getSaldoEmConta() -> Double {
        return saldoEmConta
    }
    
}

let veu = Produto(nome: "Véu", preco: 250.00, quantidadeParaDesconto: 0, valorDesconto: 0)
let terno = Produto(nome: "terno", preco: 400.00, quantidadeParaDesconto: 3, valorDesconto: 350.00)
let vestido = Produto(nome: "vestido", preco: 900.00, quantidadeParaDesconto: 5, valorDesconto: veu.preco)
let bone = Produto(nome: "boné", preco: 50.00, quantidadeParaDesconto: 2, valorDesconto: 50.00)


/* vendedor João começou com 0 saldo em conta
- vendeu 3 termos ficou com saldo de  1050
- vendeu 1 terno ficou com saldo de 1450 */
print("---------- João ----------")
let joao = Vendedor(nome: "João", idade: 35, cpf: "123.321.123.321-02", saldoEmConta: 0.00)
joao.vender(quantidadeDePecas: 3, produto: terno)
print(joao.getSaldoEmConta())
joao.vender(quantidadeDePecas: 1, produto: terno)
print(joao.getSaldoEmConta())

/* vendedor Marcelo começou com 0 saldo em conta
- vendeu 5 vestidos ficou com saldo de  4250
- vendeu 1 vestido  ficou com saldo de  5150 */
print("-------- Marcelo --------")
let marcelo = Vendedor(nome: "Marcelo", idade: 28, cpf: "321.321.321-01", saldoEmConta: 0.00)
marcelo.vender(quantidadeDePecas: 5, produto: vestido)
print(marcelo.getSaldoEmConta())
marcelo.vender(quantidadeDePecas: 1, produto: vestido)
print(marcelo.getSaldoEmConta())

/* vendedor Marcos começou com 0 saldo em conta
- vendeu 3 bonés ficou com saldo de 100 // vendeu 3 e deu 1 */
print("--------- Marcos ---------")
let marcos = Vendedor(nome: "Marcos", idade: 18, cpf: "345.534.345-98", saldoEmConta: 0.00)
marcos.vender(quantidadeDePecas: 3, produto: bone)
print(marcos.getSaldoEmConta())

/* vendedor Jorge começou com 0 saldo em conta
 - vendeu 2 bonés ficou com saldo de 50 // vendeu 2 e deu 1 */
print("--------- Jorge ---------")
let jorge = Vendedor(nome: "Jorge", idade: 22, cpf: "567.567.765.567-09", saldoEmConta: 0)
jorge.vender(quantidadeDePecas: 2, produto: bone)
print(jorge.getSaldoEmConta())

/* vendedor Ulisses começou com 0 saldo em conta
 - vendeu 6 bonés ficou com saldo de 150 // vendeu 6 e deu 3 */
print("-------- Ulisses --------")
let ulisses = Vendedor(nome: "Ulisses", idade: 50, cpf: "123.345.456-53", saldoEmConta: 0.00)
ulisses.vender(quantidadeDePecas: 6, produto: bone)
print(ulisses.getSaldoEmConta())
