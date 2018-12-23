//
//  ScheduleDetailsViewController.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 8/5/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class ScheduleDetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var itemDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let indexNum = UserDefaults.standard.integer(forKey: "index")          //retrieve the index path
        
        //titleLabel.text = String(indexNum)
        
    }//end viewDidLoad
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
        
        
    }//end viewDidAPPEAR
    
    
    override func viewWillAppear(_ animated: Bool) {
        // Sets the status bar to hidden when the view has finished appearing
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Sets the status bar to visible when the view is about to disappear
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
    }
    
    
    
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)        //go back to the la
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {         //hide keyboard when click the screen off the keyboard
        
        self.view.endEditing(true)
        
    }//end of touchesBegan
    
    
    

}//end of class
