//
//  RepositorioViewModel.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct RepositorioView {
    
    var name = ""
    var language = ""
}

class RepositorioViewModel {
    
    static func save(object: Repositorio, clear: Bool = false){
        
        if clear{
            self.deleteAll()
        }
        
        try? uiRealm.write {
            //toda modificacao que for feita no banco precisa ser aqui dentro
            
            uiRealm.add(object, update: .error)
            
        }
        
    }
    
    
    //mesma funcao de cima, mas utilizando um array para incluir varios objetos do tipo repositorio
    static func saveAll(objects: [Repositorio], clear: Bool = false){
        
        if clear {
            self.deleteAll()
        }
        
        try? uiRealm.write{
            uiRealm.add(objects, update: .error)
        }
    }
    
    static func get() -> [Repositorio]{
        //pegando o conteudo do repositorio
        let results = uiRealm.objects(Repositorio.self)
        
        var repositorios: [Repositorio] = []
        repositorios.append(contentsOf: results)
        
        return repositorios
    }
    
    static func getAsView(repositorio: Repositorio?) -> RepositorioView {
        
        //Usado apenas dentro de funcao -> se a condicao for nula, ele entra no else - diferente do if let, que entra no caso de nao ser nula
        guard let repositorio = repositorio else {
            
            return RepositorioView()
        }
        
        var repositorioView = RepositorioView()
        
        repositorioView.name = repositorio.name ?? "--"
        repositorioView.language = repositorio.language ?? "--"
        
        return repositorioView
    }
    
    static func getAsView(repositorios: [Repositorio]) -> [RepositorioView]{
        
        var repositoriosView: [RepositorioView] = []
        
        repositorios.forEach{(repo) in
            
            repositoriosView.append(self.getAsView(repositorio: repo))
            
            
        }
        
        return repositoriosView
    }
    
    static func getAll() -> [RepositorioView]{
        
        return self.getAsView(repositorios: self.get())
    }
    
    static func deleteAll(){
        
        let results = uiRealm.objects(Repositorio.self)
        
        try? uiRealm.write {
            uiRealm.delete(results)
        }
    }
}
