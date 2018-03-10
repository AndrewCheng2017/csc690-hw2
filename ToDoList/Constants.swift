//
//  Constants.swift
//  ToDoList
//
//  Created by Andrew C. on 3/7/18.
//  Copyright © 2018 Andrew Cheng. All rights reserved.
//

import Foundation

class ToDoItem: NSObject, NSCoding
{
    var title: String
    var done: Bool
    
    required init(title:String) {
        self.title = title
        self.done = false
    }
    
    required init(coder aDecoder: NSCoder) {
        self.title = (aDecoder.decodeObject(forKey: "title") as? String)!
        self.done = aDecoder.decodeBool(forKey: "done")
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.done, forKey: "done")
    }
}

extension ToDoItem
{
    public class func getMockData() -> [ToDoItem]
    {
        return [
            ToDoItem(title: "Milk"),
            ToDoItem(title: "Chocolate"),
            ToDoItem(title: "Light bulb"),
            ToDoItem(title: "Dog food")
        ]
    }
}

var todoList: [ToDoItem]?

func archiveData(todoItem : [ToDoItem]) -> NSData {
    return NSKeyedArchiver.archivedData(withRootObject: todoItem as NSArray) as NSData
}

func saveData(todoList: [ToDoItem]){
    let archivedObject = archiveData(todoItem: todoList)
    UserDefaults.standard.set(archivedObject, forKey: "todoList")
    UserDefaults.standard.synchronize()
}

func fetchData() -> [ToDoItem]? {
    if let unarchivedObject = UserDefaults.standard.object(forKey: "todoList") as? Data {
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [ToDoItem]
    }
    
    return nil
}
