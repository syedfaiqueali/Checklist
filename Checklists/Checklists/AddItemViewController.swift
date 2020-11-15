//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Faiq on 15/11/2020.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    //MARK:- IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    //Variable Delegate
    weak var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    //MARK:- IBActions
    @IBAction func cancel(){
        //navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        //navigationController?.popViewController(animated: true)
        
        let item = ChecklistItem()
        item.text = textField.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    //MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK:- Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        //to check if the new text is empty or not
        //another alternate is below:
        //doneBarButton.isEnabled = !newText.isEmpty
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
        
    }
    
    //handle clear button correctly and done button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
