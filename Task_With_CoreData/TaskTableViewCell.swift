//
//  TaskTableViewCell.swift
//  Task_With_CoreData
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var checkSwitch: UISwitch!
    
    var task: Task?
    var delegate: TaskTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension TaskTableViewCell {
    @IBAction func checkSwitchTapped(sender: AnyObject) {
        delegate?.checkValueChanged(self, selection: checkSwitch.on)
    }
}

extension TaskTableViewCell{
    func updateTaskCell(task: Task){
        self.task = task
        
        titleLabel.text = task.title
        bodyLabel.text = task.body
        checkSwitch.on = task.isChecked.boolValue
        
        if task.isChecked.boolValue {
            titleLabel.textColor = UIColor.grayColor()
            bodyLabel.textColor = UIColor.grayColor()
            self.checkSwitch.onImage = UIImage(named: "incomplete")
        } else {
            titleLabel.textColor = UIColor.blackColor()
            bodyLabel.textColor = UIColor.blackColor()
            self.checkSwitch.onImage = UIImage(named: "complete")
        }
    }
}

protocol TaskTableViewCellDelegate: class {
    func checkValueChanged(cell: TaskTableViewCell, selection: Bool)
}
