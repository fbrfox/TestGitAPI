//
//  RepositoryItem.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryItem: Mappable {
   
    
    var fullName : String?
    var itemDescription: String?
    var stargazersCount: Int?
    var owner : RepositoriesOwner?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.fullName <- map["full_name"]
        self.itemDescription <- map["description"]
        self.stargazersCount <- map["stargazers_count"]
        self.owner <- map["owner"]
    }
    
    
    
    
}
