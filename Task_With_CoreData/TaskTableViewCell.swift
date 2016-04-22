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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension TaskTableViewCell {
    @IBAction func checkSwitchTapped(sender: AnyObject) {
        
    }
}
