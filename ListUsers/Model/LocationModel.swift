//
//  LocationModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class LocationModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        street <- map["street"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        postcode <- map["postcode"]
        coordinates <- map["coordinates"]
//        timezone <- map["timezone"]
   }
   
    var street: StreetModel?
    var city: String?
    var state: String?
    var country: String?
    var postcode: Int?
    var coordinates: CoordinatesModel?
//    var timezone: Any?
}
