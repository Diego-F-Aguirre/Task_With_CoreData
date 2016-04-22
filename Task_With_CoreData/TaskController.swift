//
//  TaskController.swift
//  Task_With_CoreData
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let sharedInstance = TaskController()
    private let kTask = "Task"
    
    var tasks: [Task] {
        guard let tasks = fetchAllTasks() else { return [] }
        return tasks
    }
}

/**********************/
/** C.R.U.D. Methods **/
/**********************/
extension TaskController {
    // Create
    func createTask(title: String, body: String, isChecked: Bool) {
        let _ = Task(title: title, body: body, isChecked: isChecked)
        saveTask()
    }
    
    // Retrieve
    func fetchAllTasks() -> [Task]? {
        let request = NSFetchRequest(entityName: kTask)
        let context = Stack.sharedStack.managedObjectContext
        
        var tasks: [Task] = []
        
        do {
            tasks = try context.executeFetchRequest(request) as! [Task]
            print("Tasks fetcth request successful \(tasks)")
        } catch let error as NSError {
            print("failed \(error.localizedDescription) in \(#function)")
            return nil
        }
        return tasks
    }
    
    // Update / Save
    func saveTask() {
        let context = Stack.sharedStack.managedObjectContext
        
        do {
            let _ = try context.save()
        } catch let error as NSError {
            print("Save failed \(error.localizedDescription) in \(#function)")
        }
    }
    
    // Remove / Delete
    func removeTask(task: Task) {
        task.managedObjectContext?.deleteObject(task)
        saveTask()
    }
}

extension TaskController {
    func updateCheckValueChanged(task: Task, selected: Bool) {
        task.isChecked = selected
    }
}

















