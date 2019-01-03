//
//  StartupViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/1/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {

    
    @IBOutlet weak var startingNumberField: UITextField!        //used to get the starting identifier number for MAC addresses
    
    @IBOutlet weak var computerName: UITextField!
        //name for each computer in the series
    
    @IBOutlet weak var continueButtonOutlet: Button!
    
    var MACdictionary = [String : String]()        //used to hold all the mac addresses
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
        
        
    }//end of viewDidLoad
    
    
    
    
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        
        if((startingNumberField.text?.isEmpty == false) && (computerName.text?.isEmpty == false)) {
            
            UserDefaults.standard.set(startingNumberField.text, forKey:"startNumber")       //save number to user defaults
            UserDefaults.standard.set(computerName.text, forKey: "computerName")    //save the computer name
            performSegue(withIdentifier: "continue", sender: nil)   //move to ViewController
            UserDefaults.standard.set(object: MACdictionary, forKey: "data")        //save the dictionary
            
            
        }
        
    }//end of continueButtonPressed function
    

    
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }//end of touchesBegan
    
    
    
    
    
}//end of class
