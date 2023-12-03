//
//  StringExtension.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit

extension String {
        
    var isValidUser : Bool {
        let RegEx = "^(?=.*[a-zA-Z]+\\d\\d\\d)[a-zA-Z0-9]{6,}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let result = Test.evaluate(with: self)
        return result
    }
}
