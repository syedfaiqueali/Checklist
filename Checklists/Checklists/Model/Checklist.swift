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
    var iconName = "No Icon"
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        /*
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
 */
        /**
         reduce() is a method that looks at each item in the array and perfroms the code in the {} block. Initially, the cnt variable contains the value 0, but after each item it is incremented by either 0 or 1, depending on whether the item was checked-that check is done using our new friend, the ternary operator.
         
         When reduce() is done, its return value is the total count if unchecked items.
         */
        return items.reduce(0) {
            cnt, item in cnt + (item.checked ? 0 : 1)
        }
    }
    
}
