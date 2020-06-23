//
//  ToDoTableViewController.swift
//  ToDoListPractice
//
//  Created by Nick & Krista on 6/22/20.
//  Copyright © 2020 gabriella. All rights reserved.
//

import UIKit

func createToDos() -> [ToDo] {

  let swift = ToDo()
  swift.name = "Learn Swift"
  swift.important = true

  let dog = ToDo()
  dog.name = "Walk the Dog"
  // important is set to false by default

  return [swift, dog]
}
    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = createToDos()
}
        
  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos [indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
            else{
                cell.textLabel?.text = toDo.name
            }
        }
        return cell
    }
    


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }    
    }
    
   

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self        }
    }
   


