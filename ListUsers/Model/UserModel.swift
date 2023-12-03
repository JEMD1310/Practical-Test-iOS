//
//  UserModel.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit
import ObjectMapper

class UserModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        gender <- map["gender"]
        name <- map["name"]
        location <- map["location"]
        email <- map["email"]
        login <- map["login"]
        dob <- map["dob"]
        phone <- map["phone"]
        cell <- map["cell"]
        id <- map["id"]
        picture <- map["picture"]
        nat <- map["nat"]

   }
   
    var gender: String?
    var name: NameModel?
    var location: LocationModel?
    var email: String?
    var login: LoginModel?
    var dob: DobModel?
    var phone: String?
    var cell: String?
    var id: IdModel?
    var picture: PictureModel?
    var nat: String?

}
