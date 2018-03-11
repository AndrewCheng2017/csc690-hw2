//
//  ViewController.swift
//  ToDoList
//
//  Created by Andrew C. on 3/7/18.
//  Copyright © 2018 Andrew Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To-Do List"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let todo = todoList {
            return todo.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        if let todo = todoList{
            let item = todo[indexPath.row]
            cell.textLabel?.text = item.title
            
            let accessory: UITableViewCellAccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }
        
        return cell
    }

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            todoList?.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < (todoList?.count)!{
            let item = todoList![indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Editing Task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = todoList![indexPath.row].title
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                todoList![indexPath.row].title = alert.textFields!.first!.text!
                saveData(todoList: todoList!)
                tableView.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            todoList!.remove(at: indexPath.row)
            saveData(todoList: todoList!)
            tableView.reloadData()
        })

        return [editAction, deleteAction]
    }
}

