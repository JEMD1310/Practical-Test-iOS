//
//  CoordinatesModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class CoordinatesModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
   }
   
    var latitude: String?
    var longitude: String?
}
