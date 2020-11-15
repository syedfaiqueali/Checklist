//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Faiq on 15/11/2020.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    //MARK:- IBActions
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(){
        print(textField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
