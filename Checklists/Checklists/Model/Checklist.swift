//
//  Checklist.swift
//  Checklists
//
//  Created by Faiq on 16/11/2020.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name = ""
    var items = [ChecklistItem]()  //creates an empty array of ChecklistItem obj
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
