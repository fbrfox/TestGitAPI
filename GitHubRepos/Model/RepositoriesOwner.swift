//
//  RepositoriesOwner.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoriesOwner: Mappable {
    
    var avatarUrl : String?
    var login : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        avatarUrl <- map["avatar_url"]
        login <- map["login"]
    }
}
