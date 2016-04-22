//
//  TaskListViewController.swift
//  Task_With_CoreData
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        cell.updateTaskCell(task)
        cell.delegate = self
        
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

extension TaskListViewController {
    @IBAction func addTaskButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Add a task", message: "Enter a task you wish to keep track of", preferredStyle: .Alert)
        var inputTitleTextField: UITextField?
        var inputBodyTextField: UITextField?
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        let doneAction = UIAlertAction(title: "Done", style: .Default) { (_) in
            if let inputTitleTextField = inputTitleTextField,
                title = inputTitleTextField.text,
                inputBodyTextField = inputBodyTextField,
                body = inputBodyTextField.text
            {
                TaskController.sharedInstance.createTask(title, body: body, isChecked: false)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            inputTitleTextField = textField
        }
        
        alertController.addTextFieldWithConfigurationHandler { (bodyTextField) in
            inputBodyTextField = bodyTextField
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

extension TaskListViewController: TaskTableViewCellDelegate {
    func checkValueChanged(cell: TaskTableViewCell, selection: Bool) {
        guard let task = cell.task else { return }
        
        TaskController.sharedInstance.updateCheckValueChanged(task, selected: selection)
        tableView.reloadData()
    }
}















