//
//  Repositorio.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Repositorio: Object, Mappable{
    @objc dynamic var name: String? //@objc dynamic somente com isso o Realm consegue detectar valor - sem será nulo
    @objc dynamic var language: String?

    
    //os dois metodos abaixo sao implementacoes obrigatorias no momento que usamos no Repositorio
    required convenience init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        // <- indica qual campo ira mapear e manda o valor para a variavel
        self.name     <- map["name"]
        self.language   <- map["language"]
    }
}

