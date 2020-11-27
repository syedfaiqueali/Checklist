//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Faiq on 15/11/2020.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1  //id is a special keyword in ObjC thats why using itemID
    
}
