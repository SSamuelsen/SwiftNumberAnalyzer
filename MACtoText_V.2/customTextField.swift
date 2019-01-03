//
//  customTextField.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/24/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import Foundation
import UIKit

class SSTextField: UITextField {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        
        textColor = .white
        backgroundColor = .clear
        font = UIFont(name: "Helvetica Neue", size: 20)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    
    
}
