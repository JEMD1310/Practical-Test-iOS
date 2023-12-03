//
//  InfoModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class InfoModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        seed <- map["seed"]
        results <- map["results"]
        page <- map["page"]
        version <- map["version"]
   }
   
    var seed: String?
    var results: Int?
    var page: Int?
    var version: String?
}
