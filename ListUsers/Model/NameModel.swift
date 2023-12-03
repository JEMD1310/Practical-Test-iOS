//
//  NameModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class NameModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        first <- map["first"]
        last <- map["last"]
   }
   
    var title: String?
    var first: String?
    var last: String?
}
