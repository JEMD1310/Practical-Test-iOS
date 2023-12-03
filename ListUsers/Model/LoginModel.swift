//
//  LoginModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class LoginModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        uuid <- map["uuid"]
        username <- map["username"]
        password <- map["password"]
   }
   
    var uuid: String?
    var username: String?
    var password: String?
}
