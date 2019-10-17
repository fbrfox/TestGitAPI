//
//  Repositories.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositories: Mappable {
    
    var totalCount : Int?
    var items : [RepositoryItem]?
    
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        
        totalCount <- map["total_count"]
        items <- map["items"]
     
    }
    
    
}
