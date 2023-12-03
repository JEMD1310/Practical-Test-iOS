//
//  PictureModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class PictureModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        large <- map["large"]
        medium <- map["medium"]
        thumbnail <- map["thumbnail"]
   }
   
    var large: String?
    var medium: String?
    var thumbnail: String?
}
