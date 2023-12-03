//
//  RemoteDataManager.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 03/12/23.
//

import UIKit
import FirebaseFirestore

class RemoteDataManager {
    private static let _shared = RemoteDataManager()

    static var shared:RemoteDataManager {
        return _shared
    }
    
    let ReferenceDevice = "devices"
    var dataBaseReference = Firestore.firestore()
    
    var devices:CollectionReference {
        return dataBaseReference.collection(ReferenceDevice)
    }
    
    func saveDataBattery(identifier:String, device: String, dateString: String, batteryLevel: Int, completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
        devices.document(identifier).setData([
            "device": "\(device)",
            "batteryLevel": "\(batteryLevel) %",
            "date": dateString
            ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
                completionHandler(false)
            }else{
                completionHandler(true)
            }
        }
    }
}
