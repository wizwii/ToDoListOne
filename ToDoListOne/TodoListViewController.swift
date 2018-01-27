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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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





















