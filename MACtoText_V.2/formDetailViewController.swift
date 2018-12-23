//
//  formDetailViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/24/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class formDetailViewController: UIViewController {

    
    
    @IBOutlet weak var pcNameField: UITextField!        //shows the pc name 
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var desk: UITextField!
    @IBOutlet weak var employeeID: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    @IBOutlet weak var mac: UITextField!
    @IBOutlet weak var ticketNum: UITextField!
    @IBOutlet weak var otherApps: UITextField!
    
    
    
    
    var formToView: Forms!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        showData()                  //present data
        
        
        
        
        
        
    }
    

    
     
    
    func showData() {
        
        //add all the fields here
        if let pcName = formToView.pcName {         //grab the information from our formToView item passed from the collectionFormViewController in CoreData
            pcNameField.text = pcName
            
        }
        if let departmentName = formToView.department {
            department.text = departmentName
        }
        
        if let name = formToView.employeeName {
            employeeName.text = name
        }
        
        if let deskNum = formToView.desk {
            desk.text = deskNum
        }
        if let employee = formToView.employeeID {
            employeeID.text = employee
        }
        if let date = formToView.dueDate {
            dueDate.text = date
        }
        if let macAdd = formToView.mac {
            mac.text = macAdd
        }
        if let ticketNumber = formToView.ticket {
            ticketNum.text = ticketNumber
        }
        if let applications = formToView.appsInstalled {
            otherApps.text = applications
        }
        
        
        
        
        
    }//end of showData
    
    
    func deleteForm() {
        
        if formToView != nil {
            context.delete(formToView!)     //delete the form
            ad.saveContext()            //re-save
        }
        
        
        
        
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        deleteForm()
        _ = navigationController?.popViewController(animated: true)     //go back to previous view controller
    }
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {         //hide keyboard when click the screen off the keyboard
        
        self.view.endEditing(true)
        
    }//end of touchesBegan
    
    
    
    
    

}//end of class
