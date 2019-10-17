//
//  RepositoriesPresenter.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import UIKit

protocol RepositoriesPresenterLoginc {
 
    func feachAllRepositories()
    
}


class RepositoriesPresenter: RepositoriesPresenterLoginc {
    
    
    
    weak var viewController : RepositoriesView?
    
    
    func feachAllRepositories() {
        
        
        viewController?.displayLoadingView(show: true)
        
        RepositoriesServices.shared().fetchRepositories { (repositories, statusCode) in
            
            self.viewController?.displayLoadingView(show: false)
            
            if statusCode != 500 {
                
                self.viewController?.feachAllRepositories(repositories: repositories?.items ?? [])
            }
            else{
                
                self.viewController?.errorFeachRespositories(error: "an error occurred while processing your request. Try again later!")
            }
            
            
        }
        
    }
    
}
