//
//  UserListResponse.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class UserListResponse: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        results <- map["results"]
        info <- map["info"]

   }
   
    var count: Int?
    var next: String?
    var previous: String?
    var results: [UserModel]?
    var info: InfoModel?
}
