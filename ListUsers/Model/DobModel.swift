//
//  DobModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class DobModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        age <- map["age"]
   }
   
    var date: String?
    var age: Int?
}

