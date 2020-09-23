//
//  CoreDataModel.swift
//  TaskDemoFluper
//
//  Created by kushalkumar nora on 16/08/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class coreDataModel {
    
    static let shareInstance = coreDataModel()
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(object:[String:String]){
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
     //   print("\(object)")
        // dict = ["title":item["title"] ?? "" ,"description":item["description"] ?? "","urlToImage":item["urlToImage"] ?? ""]
        person.name = object["name"]
        person.favCricketr = object["favCricketr"]
        person.flagColour = object["flagColour"]
        person.date = object["date"]
       
        
            do {
            try context.save()
           
        } catch  {
            print("error:\(error)")
        }
        
    }
    
    
    func getDataCore()-> [Person] {
     var person = [Person]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"Person")
        do {
        
            person =  try context.fetch(fetchRequest) as! [Person]
            //print("\(person.count)")
        } catch  {
            print("error:\(error)")
        }
        
        
        return person
    }
    
    
    func delete(index:Int)-> [Person] {
        var person = getDataCore()
        context.delete(person[index])
        person.remove(at: index)
        
        do {
            try context.save()
        } catch  {
            print("error")
        }
        return person
        
    }
    
    func editDAta(object:[String:String],i:Int){
        
        var person = getDataCore()
        
        if person != nil {
            
            person[i].name = object["name"]
            person[i].favCricketr = object["favCricketr"]
            person[i].flagColour = object["flagColour"]
            person[i].date = object["date"]
          
            
        }
      do {
            try context.save()
        } catch  {
            print("error:\(error)")
        }
    }
    
    
}


