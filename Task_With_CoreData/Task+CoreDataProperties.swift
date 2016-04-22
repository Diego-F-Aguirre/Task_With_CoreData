//
//  Task+CoreDataProperties.swift
//  Task_With_CoreData
//
//  Created by Diego Aguirre on 4/22/16.
//  Copyright © 2016 home. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var title: String
    @NSManaged var body: String
    @NSManaged var isChecked: NSNumber

}
