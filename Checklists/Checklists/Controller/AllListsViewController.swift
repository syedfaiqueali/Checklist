//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Faiq on 16/11/2020.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    //Constants
    let cellIdentifier = "ChecklistCell"
    
    //Instance Variables
    var lists = [Checklist]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Enable large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        //Dummy Data
        var list = Checklist(name: "Birthdays")
        lists.append(list)
        
        list = Checklist(name: "Groceries")
        lists.append(list)
        
        list = Checklist(name: "To Do")
        lists.append(list)
        
    }
    
    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            //passing only the particular object
            controller.checklist = sender as? Checklist
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let checklist = lists[indexPath.row]
        
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }

    //MARK:- Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checklist = lists[indexPath.row]
        //sending checklist object here to set title name of All list
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
}
