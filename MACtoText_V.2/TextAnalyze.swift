//
//  TextAnalyze.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 6/29/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import Foundation
import SwiftOCR


class Analyze {
    
    let swiftText = SwiftOCR()
    //let myImage = UIImage(named: "code")
    
    
    var MAC: String?
    let empty: String = ""
    
    
    
    
    
    
    
    
    func recognizeText(image: UIImage) -> String {
        
        //print("Testing SWIFT OCR")
        
        swiftText.recognize(image, {text in
            //print(text)
            self.MAC = text
            
        })
        
        if(MAC != nil){
            return(MAC!)
        }
        else {
            return(empty)
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}//end of class
