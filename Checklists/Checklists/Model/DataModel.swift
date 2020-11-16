//
//  DataModel.swift
//  Checklists
//
//  Created by Faiq on 16/11/2020.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklist()
    }
    
    //MARK:- Data Saving
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL{
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    //MARK:- Save Data File
    //This method take contents of the items array, converts it to
    //a block of binary data, and then writes this data to a file.
    func saveChecklist(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    //MARK:- Load the file
    func loadChecklist(){
        let path = dataFilePath()
        
        //load contents of Checklist.plist into a new data object
        if let data = try? Data(contentsOf: path) {
            //When find .plist file, we'll load entire array and its content from file using PropertyListDecoder
            let decoder = PropertyListDecoder()
            do {
                //for loading and populating
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
    
    
    
}
