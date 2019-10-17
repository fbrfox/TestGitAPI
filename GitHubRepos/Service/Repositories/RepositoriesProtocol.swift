//
//  RepositoriesProtocol.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import Foundation

protocol RepositoriesProtocol {
    
    
    func fetchRepositories(completionHandler: @escaping (Repositories?,_ statusCode:Int)-> Void)
    
}
