//
//  StreetModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class StreetModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        name <- map["name"]
   }
   
    var number: Int?
    var name: String?
}

