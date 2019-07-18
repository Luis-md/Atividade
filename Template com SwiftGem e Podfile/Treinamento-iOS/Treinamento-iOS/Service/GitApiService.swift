//
//  GitApiService.swift
//  Treinamento-iOS
//
//  Created by administrador on 17/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


protocol GitApiServiceDelegate {
    
    func success()
    func failure(error: String)

}

class GitApiService {

    var delegate: GitApiServiceDelegate!
    
    init(delegate: GitApiServiceDelegate){
        self.delegate = delegate
    }
    
    func getRepositorio(username: String){
        
        GitApiRequestFactory.getRepositorios(username: username).validate().responseArray { (response: DataResponse<[Repositorio]>) in
            
            
            switch response.result{
            case .success:
                
                if let repositorios = response.result.value { //vai retornar o array do repositorio pegando do json da request
                    //salvando no banco
                    RepositorioViewModel.saveAll(objects: repositorios, clear: true)
                    
                    
                    
                    /*for repositorio in repositorios {
                        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
                        print("name: \(repositorio.name ?? "")")
                        print("language: \(repositorio.language ?? "")")
                    }*/
                }
                
                self.delegate.success()
                
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
            
        }
    }
}
