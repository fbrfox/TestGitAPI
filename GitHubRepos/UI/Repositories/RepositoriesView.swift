//
//  RepositoriesView.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import UIKit

protocol RepositoriesView : class  {

    func feachAllRepositories(repositories: [RepositoryItem])
    func errorFeachRespositories(error : String)
    func displayLoadingView(show : Bool)
}
