//
//  menuCell.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 8/1/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import Foundation

import UIKit

class menuCell: UICollectionViewCell {
    
    @IBOutlet weak var menuLabel: UILabel!
    
    
    func configureCell(forms: Forms) {
        
        menuLabel.text = forms.pcName
        
    }
    
    
    
}
