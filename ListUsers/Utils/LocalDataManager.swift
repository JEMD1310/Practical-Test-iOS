//
//  LocalDataManager.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 03/12/23.
//

import UIKit
import CoreData

class LocalDataManager: NSObject {
    static let sharedInstance = LocalDataManager()
    
    func saveBatteryDetail(batteryLevel: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "BatteryDetail", in: context) else {
            return
        }
        
        guard let dbTransaction = NSManagedObject(entity: entity, insertInto: context) as? BatteryDetail else {
            return
        }

        dbTransaction.id = UUID().uuidString
        dbTransaction.device = UIDevice.current.identifierForVendor!.uuidString
        dbTransaction.date = Date()
        dbTransaction.batteryLevel = Int32(batteryLevel)
        
        do {
            try context.save()
        } catch let error {
            print("DataBase: \(error.localizedDescription)")
        }
    }
    
    private func getBatteryDetail(completionHandler: @escaping(_ items:[BatteryDetail]) -> Void ) {
        var items:[BatteryDetail] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetch: NSFetchRequest<BatteryDetail> = BatteryDetail.fetchRequest()

        do {
            items = try context.fetch(fetch)
        } catch let error {
            print("DataBase: \(error.localizedDescription)")
        }
        
        completionHandler(items)
    }

    private func deleteBatteryDetail(id: String) {
        let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BatteryDetail")
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    context.delete(managedObjectData)
                }
            }
        } catch let error {
            print("DataBase: \(error.localizedDescription)")
        }
    }
    
    func updateDataFirebase() {
        getBatteryDetail { items in
            for item in items {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YY/MM/dd HH:mm:ss"
                let dateString = dateFormatter.string(from: item.date ?? Date())
                let identifier = item.id ?? ""
                let device = item.device ?? ""
                let batteryLevel = Int(item.batteryLevel)
                
                RemoteDataManager.shared.saveDataBattery(identifier: identifier, device: device, dateString: dateString, batteryLevel: batteryLevel) { isSuccess in
                    if isSuccess {
                        self.deleteBatteryDetail(id: identifier)
                    }
                }
            }
        }
    }
}
