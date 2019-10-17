//
//  RepositoriesServices.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class RepositoriesServices: RepositoriesProtocol {
    
    
    private static var instance = RepositoriesServices()
    
    
    class func shared() ->  RepositoriesServices{
        return instance
    }
    
    
    let URL = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    
    func fetchRepositories(completionHandler: @escaping (Repositories?, Int) -> Void) {
        
        do {
            
            try Alamofire.request(URL.asURL()).responseObject(completionHandler: { (response : DataResponse<Repositories> ) in
        
                if response.error != nil {
                    
                    completionHandler(nil, 500)
                }
                else {
                    
                    completionHandler(response.result.value,200)
                }
                
                
            })
            
        } catch  {
            
            completionHandler(nil,500)
        }
        
        
    }
    
    
    
}
