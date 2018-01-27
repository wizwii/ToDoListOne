//
//  ViewController.swift
//  ToDoListOne
//
//  Created by Visit Pool on 1/26/2561 BE.
//  Copyright © 2561 Visit Pool. All rights reserved.
//

import UIKit

class TodoListViewController : UITableViewController {
    
    var itemArray = ["Read math", "Go to CVS", "See a doctor"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }

    //MARK - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        print(itemArray[indexPath.row])
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //global variable
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item.", message: "", preferredStyle: .alert)
        
//what will happen once the user clicks the Add Item button on our UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
//        print (textField.text)
//        self.itemArray.append(textField.text!)
//        print(self.itemArray.count)
// if textField.text! is nil then append whatever inside the "".
// self.itemArray.append(textField.text! ?? "xxx")
            self.itemArray.append(textField.text!)
            //to make data persist
            // (self.itemArray, forKey: "TodoListArray")  == > same as value pair(data in that file), key pair(just like a file name in computer)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            
            textField = alertTextField
            
//            print(textField.text)
//            print("now..")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}





















