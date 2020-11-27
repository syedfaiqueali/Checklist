//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Faiq on 15/11/2020.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1  //id is a special keyword in ObjC thats why using itemID
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    //MARK:- Helper Methods
    //This compares the due date on the item with the current date
    //If due date is in future than return true
    func scheduleNotification() {
        if shouldRemind && dueDate > Date() {
            //1 -Put text into notification message
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default
            
            //2 -Extract yyyy/mm/dd/h/min from due date
            let calender = Calendar(identifier: .gregorian)
            let components = calender.dateComponents(
                [.year, .month, .day, .hour, .minute],
                from: dueDate)
            
            //3 -To show notification at a particular date
            let trigger = UNCalendarNotificationTrigger(
                dateMatching: components,
                repeats: false)
            
            //4 -Convert item's numeric ID into a string and use to identify the notification
            let request = UNNotificationRequest(
                identifier: "\(itemID)",
                content: content,
                trigger: trigger)
            
            //5 -Add the new notification to UNUserNotificationCenter
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
}
