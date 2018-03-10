//
//  CoreDataModel.swift
//  TodayToday
//
//  Created by 涂舒舰 on 2018/3/8.
//  Copyright © 2018年 涂舒舰. All rights reserved.
//

import UIKit
import CoreData

class CoreDataModel {
    
    private let context = CoreDataStorage.sharedInstance.mainQueueContext
    
    private func saveContext() {
        CoreDataStorage.sharedInstance.saveContext(context)
    }
    
    func getNumers() -> [Int] {
        var nums = [Int]()
        
        do {
            let request = NSFetchRequest<Data>(entityName: "Data")
            //let request: NSFetchRequest<NSFetchRequestResult> = Data.fetchRequest()
            //let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Level")
            let data = try context.fetch(request)
            nums = data.map { Int($0.num)}
        } catch {
            print("error")
        }
        
        return nums
    }
    
    func addNew(number: Int) {
        let entity = NSEntityDescription.entity(forEntityName: "Data", in: context)
        let newData = Data(entity: entity!, insertInto: context)
        newData.num = Int32(number)
        saveContext()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
