//
//  AddController.swift
//  ToDoList
//
//  Created by Andrew C. on 3/7/18.
//  Copyright © 2018 Andrew Cheng. All rights reserved.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPressed(_ sender: UIButton) {
        if (textField.text != nil) && textField.text != "" {
            
            let objToDoItem = ToDoItem(title: textField.text!)
            todoList?.append(objToDoItem)
            
            textField.text = ""
            textField.placeholder = "Add more?"
        }
    }

}
