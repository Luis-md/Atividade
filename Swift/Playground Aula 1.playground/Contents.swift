import UIKit
import Foundation

// Variáveis
var nome = "José Matela"

var nome1: String = "José Matela"

var number: Float = 10.0

//COMENTARIOS
/*COMENTARIOS*/

// Constantes

let nome2 = "José Matela"

let nome3: String = "José Matela"

let MAX_PASSWORD_LENGTH = 8

// Tuplas

var tupla: (String, String, Int) = ("Matela", "Jobson", 2)

print(tupla.0)

print(tupla.1)

print(tupla.2)

var tupla2: (nome: String, sobrenome: String) = (nome: "Jobson Mateus", sobrenome: "Alves Macedo")

print(tupla2.nome)

print(tupla2.sobrenome)

var tupla3 = (nome: "Jobson Mateus", sobrenome: "Alves Macedo")

// Optional

var variavel: String?

var variavel2: Int!

// nil = null

var numberString = "10"

var intValue = Int(nome)

intValue = Int(numberString)!

var intValue2 = Int(number)

// Estruturas de decisão

if number == 10 {
    print("Dez")
} else if number == 5 {
    print("Cinco")
} else {
    print("Outros")
}

print((number == 10) ? "Dez" : "Outro numero")


switch number {
case 0:
    print("Zero")
case 1:
    print("Um")
default:
    break
}

if let aux = variavel {
    print(aux)
}

if let variavel = variavel {
    print(variavel)
}

if var variavel = variavel {
    variavel = "variável"
    print(variavel)
}

var label = UILabel()
label.text = variavel ?? "-"

var sender: Any = UILabel()

if let sender = sender as? UILabel {
    sender.text == "dfdjkh"
}

let constante = sender as! UILabel


//Array

var array: [Int] = []
var matriz: [[Int]] = []

array.append(1)
array[0] = 1
print(array[0])

matriz.append([])
matriz[0].append(1)

array.count
array.removeAll()

//Estruturas de repetição

for index in 0..<array.count {
    print(array[index])
}

for posicao in array {
    print(posicao)
}

for var posicao in array {
    posicao = 0
    print(posicao)
}

var index = 0
while index >= 10 {
    print(index)
    index += 1
}

//Dicionarios

var dicionario = Dictionary<String,Any>()

var dicionario2 = [String:Int]()

dicionario = [
    "numero": 1,
    "string": "valor"
]

dicionario["key"] = "valor2"
print(dicionario["key"] ?? "Nulo")

if let value = dicionario["numero"] as? String {
    print(value)
} else if let value = dicionario["numero"] as? Int {
    print(value)
}

for posicao in dicionario {
    print("\(posicao.key): \(posicao.value);")
}

for key in dicionario.keys { //Percorrendo as chaves
    print("key: \(key)")
}

for value in dicionario.values { //Percorrendo os valores
    print("value: \(value)")
}

//Funções

func funcao(param: Int) -> Int {
    var paramAux = param
    
    paramAux += 5
    return paramAux
}


var int = 1
int = funcao(param: int)

func funcao(_ param: Int) -> Int {
    return param * 10
}

func funcao(param: Int, param2: String) {
    print(param)
    print(param2)
    
}

func funcao(param1: Int? = nil) {
    if let param = param1 {
        print(param)
    }
    print("nil")
}

funcao(param: int)
funcao(int)
funcao(param: int, param2: "teste")
funcao(param1: int)
funcao()

// Closures
array.forEach { (valor) in
    print(valor)
}

array.forEach({ print($0) })

let numbers = array.filter { (valor) -> Bool in
    
    return valor > 0
}

let numbers2 = array.filter({ $0 > 0 })

let reversed = array.sorted { (v1, v2) -> Bool in
    
    return v1 > v2
}

let reversed2 = array.sorted(by: { $0 > $1 })

func testeClosure(param: String, closure: () -> Void) {
    
    closure()
}


testeClosure(param: "string") {
    print("a")
}

//Classe

class Pessoa {
    var nome: String?
    var idade: Int?
    var genero: Genero?
    
    init(nome: String, idade: Int, genero: String) {
        
        self.nome = nome
        self.idade = idade
        self.genero = Genero(rawValue: genero)
    }
    
    func getNome() -> String {
        return self.nome ?? "-"
    }
}

//Enum

enum Genero: String {
    case M = "Masculino"
    case F = "Feminino"
}

let pessoa = Pessoa(nome: "José Matela", idade: 20, genero: "Masculino")

if pessoa.genero == .M {
    print(Genero.M.rawValue)
}

struct PessoaView {
    
    var nome: String = ""
    var idade: Int = 0
    var genero: Genero = .M
    var nascimento = Date()
    
    var nascimentoString: String {
        
        // Conversao para String
        
        
        return "10/02/1997"
    }
    
    var nome2: String {
        didSet {
            funcao()
        }
    }
}

extension UITableView {
    
    func funcaoTableView() {
        print("funcao Extension")
    }
}


let tableView = UITableView()

tableView.funcaoTableView()
