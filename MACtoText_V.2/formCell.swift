//
//  formCell.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/19/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//

import UIKit

class formCell: UICollectionViewCell {
    
    @IBOutlet weak var formLabel: UILabel!          //conects to the label in the collection view
    
    func configureCell(forms: Forms) {
        
        formLabel.text = forms.pcName
        
    }
    
    
    
}
