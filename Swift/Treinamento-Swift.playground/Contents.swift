import UIKit
import Foundation

//MARK: - Variáveis, Constantes e Tuplas

// Variáveis:
var str = "String"

var number: Int = 0

// Constantes:

let MAX_LENGTH = 30

let MIN_LENGTH: Int = 0

let STR_LENGHT = str.count

// Tuplas:

var tupla = ("José", "Matela")

var pessoa = (nome: "José", sobrenome: "Matela")


//MARK: - Optionals

// Declaração de variável optional
var maybe: String?                      // Declarando variável String Optional

// Conversão que retorna optional
var intVal = Int("one")                 // nil
intVal = Int("1")                       // Optional(1)

// IF LET
if let value = intVal {                 // Se for nulo não entra no if, Se não for nulo entra no if e o value recebe o valor do intVal
    print(value)                        // 1
}

print(intVal ?? 0)


//MARK: - Estruturas de Decisão

var num = 5

// IF ELSE
if num > 0 {
    print("Positivo")
} else if num < 0 {
    print("Negativo")
} else {
    print("Zero")
}

// SWITCH CASE
switch num {
case 0:
    print("Zero")
case 10:
    print("Dez")
default:
    print("Outros")
}

// MARK: - Arrays

var array: [Int] = [0, 1, 2]
array.append(3)

// MARK: - Dicionários

var dicionario = Dictionary<String, Float>() // Dicionário Vazio

var dicionario2 = [String:Float]()

var dicionario3 = [
    "primeiro": 1,
    "segundo": 2
]

print(dicionario3["primeiro"] ?? 0)                      //1

// MARK: - Estruturas de Repetição

for index in 0..<array.count {
    print(array[index])
}

for numero in array {
    print(numero)
}

for posicao in dicionario3 {
    print("Key: \(posicao.key)")
    print("Value: \(posicao.value)")
}

// MARK: - Funções e Closures

// Criação de uma função
//        (Parametros)  -> Tipo de Retorno
func somar(value1: Int, value2: Int) -> Int {       //Função com parametros e retorno
    
    return value1 + value2
}

// Chamada de uma função
let soma = somar(value1: 3, value2: 4)              //soma = 7

// Closures

// array = [0, 1, 2, 3]

let reversed = array.sorted { (value0, value1) -> Bool in //reversed = [3, 2, 1, 0]
    
    return value0 > value1
}
// Outra Forma
let reversed2 = array.sorted(by: {$0 > $1}) //reversed2 = [3, 2, 1, 0]

// MARK: Classes, Structs e Enums
enum Genero {
    case M
    case F
}

class Pessoa {
    
    var nome: String?
    var cpf: String?
    var idade: Int?
    var genero: Genero?
    
    init(nome: String, cpf: String, idade: Int, genero: Genero) {
        
        self.nome = nome
        self.cpf = cpf
        self.idade = idade
        self.genero = genero
    }
}


struct PessoaView {
    
    var nome = ""
    var cpf = ""
    var idade = 0
    var genero: Genero = .F
    
    var idadeString: String {
        return "\(self.idade) anos"
    }
    
    func getGenero() -> String {
        
        switch self.genero {
        case .M:
            return "Masculino"
        case .F:
            return "Feminino"
        }
    }
}

// MARK: - Extensions
extension Pessoa {
    func set(nome: String) {
        self.nome = nome
    }
    func set(genero: Genero) {
        self.genero = genero
    }
}
