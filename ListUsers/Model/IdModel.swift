//
//  IdModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class IdModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        value <- map["value"]
   }
   
    var name: String?
    var value: String?
}
