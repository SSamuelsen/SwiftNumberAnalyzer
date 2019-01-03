//
//  FormViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/16/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit
import CoreData

struct form {
    
    var newHireSwitch: UISwitch
    var leaseReturnSwitch: UISwitch
    var replaceSwitch: UISwitch
    var wipedSwitch: UISwitch
    var collectionSwitch: UISwitch
    var imagedSwitch: UISwitch
    var driversSwitch: UISwitch
    var primaryUserSwitch: UISwitch
    var softwareSwitch: UISwitch
    
    var employeeName: UITextField
    var departmentName: UITextField
    var employeeNumber: UITextField
    var ticketNumber: UITextField
    var pcName: UITextField
    var macAddress: UITextField
    var deskNumber: UITextField
    var dueDate: UITextField
    var otherApps: UITextView
    
    
    
}


class FormViewController: UIViewController {
    //switches
    @IBOutlet weak var newHireSwitch: UISwitch!
    @IBOutlet weak var leaseReturnSwitch: UISwitch!
    @IBOutlet weak var replaceSwitch: UISwitch!
    @IBOutlet weak var wipedSwitch: UISwitch!
    @IBOutlet weak var collectionSwitch: UISwitch!
    @IBOutlet weak var imagedSwitch: UISwitch!
    @IBOutlet weak var driversSwitch: UISwitch!
    @IBOutlet weak var primaryUserSwitch: UISwitch!
    @IBOutlet weak var softwareSwitch: UISwitch!
    
    //text
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var departmentName: UITextField!
    @IBOutlet weak var employeeNumber: UITextField!
    @IBOutlet weak var ticketNumber: UITextField!
    @IBOutlet weak var pcName: UITextField!
    @IBOutlet weak var macAddress: UITextField!
    @IBOutlet weak var deskNumber: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    @IBOutlet weak var otherApps: UITextView!
    
    
    var formName: form!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate     //reference appDelegate to work with CoreData
    
    
    
    
    
    
    
    var forms: [form] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //unselect all the switches
        newHireSwitch.isOn = false
        leaseReturnSwitch.isOn = false
        replaceSwitch.isOn = false
        wipedSwitch.isOn = false
        collectionSwitch.isOn = false
        imagedSwitch.isOn = false
        driversSwitch.isOn = false
        primaryUserSwitch.isOn = false
        softwareSwitch.isOn = false
        
        
        
        
        
        
        
        
        
        
        
    }//end of view did load
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParent) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
        
    }
    
    @objc func canRotate() -> Void {}           //used in AppDelegate to allow landscape orientation for this view Controller
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }//end of touchesBegan
    
    
    
    @IBAction func createFormButtonPressed(_ sender: Any) {         //this will save the new item to CoreData
        
        let item = Forms(context: context)
        
        
        if((pcName.text?.isEmpty != true)&&(departmentName.text?.isEmpty != true)) {        //pc name and department can't be empty before making the form
            
            //set defaults values for un-entered text
            if (employeeName.text?.isEmpty == true){
                employeeName.text = "-"
            }
            if (employeeNumber.text?.isEmpty == true){
                employeeNumber.text = "-"
            }
            if (ticketNumber.text?.isEmpty == true){
                ticketNumber.text = "-"
            }
            if (macAddress.text?.isEmpty == true){
                macAddress.text = "-"
            }
            if (deskNumber.text?.isEmpty == true){
                deskNumber.text = "-"
            }
            if (dueDate.text?.isEmpty == true){
                dueDate.text = "-"
            }
            if (otherApps.text?.isEmpty == true){
                otherApps.text = "-"
            }
            
            //set formName object equal to all the fields
            
            formName = form(newHireSwitch: newHireSwitch, leaseReturnSwitch: leaseReturnSwitch, replaceSwitch: replaceSwitch, wipedSwitch: wipedSwitch, collectionSwitch: collectionSwitch, imagedSwitch: imagedSwitch, driversSwitch: driversSwitch, primaryUserSwitch: primaryUserSwitch, softwareSwitch: softwareSwitch, employeeName: employeeName, departmentName: departmentName, employeeNumber: employeeNumber, ticketNumber: ticketNumber, pcName: pcName, macAddress: macAddress, deskNumber: deskNumber, dueDate: dueDate, otherApps: otherApps)
            
            //let computerName = formName.pcName.text         //get the computer name
            
            
            //WORK: implement test logic here to check for duplicates in pcName
            
            
            
            
            
            //if saving more information, add the attribute to the data model then generate a new NSManagedObject subclass from the xcdatamodeld file
            
            
            //saving the values:
            if let pcName = pcName.text {
                item.pcName = pcName            //set the attribute equal to the user inputed name
            }
            if let department = departmentName.text {
                item.department = department
            }
            if let employeeName = employeeName.text {
                item.employeeName = employeeName
            }
            if let ticket = ticketNumber.text {
                item.ticket = ticket
            }
            if let id = employeeNumber.text {
                item.employeeID = id
            }
            if let due = dueDate.text {
                item.dueDate = due
            }
            if let macAddress = macAddress.text {
                item.mac = macAddress
            }
            if let apps = otherApps.text {
                item.appsInstalled = apps
            }
            
            
            
            
            
            
            ad.saveContext()        //save the data
            
            //_ = navigationController?.popViewController(animated: true)
            
            
           
           
            performSegue(withIdentifier: "createForm", sender: self)        //segue to view all the forms
            
        }
        
        
        
    }//end of create form button Pressed
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let collectionFormView = segue.destination as! CollectionFormViewController     //take view controller and store it in variable
        
        
        
        if formName != nil {
        
            collectionFormView.formArray.append(formName)         //add the new form to the array
        
        }
        
        
        //save the array before going to the new controller!!!!!!!!!!!!!!
        //saveData(form: collectionFormView.formArray)        //save the array in the collectionFormView
        
        
    }
    
    
    

    
    

    
    
    func saveData(form: [form]) {           //pass in the array of forms
        let context = appDelegate.persistentContainer.viewContext           //allows for interaction with core data
        //let newForm = NSEntityDescription.insertNewObject(forEntityName: "Forms", into: context) as! form      //save into context
        
        for item in form {
            let newForm = NSEntityDescription.insertNewObject(forEntityName: "Forms", into: context) as! Forms
            //To get firstName, lastName and age access the item
            newForm.department = item.departmentName.text
            newForm.pcName = item.pcName.text
           
            
        }
        
        
        
        
        
        do {
            
            try context.save()          //save the data
            print("works")
            
            
            
        }
        catch {
            
            
            
        }
        
    }//end of saveData
    
    
    
    
    
    
    
    

}//end of class
