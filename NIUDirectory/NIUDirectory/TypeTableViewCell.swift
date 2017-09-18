//
//  TypeTableViewCell.swift
//  NIUDirectory
//
//  Created by Jyostna Ankam on 4/10/17.
//  Copyright © 2017 Jyostna Ankam. All rights reserved.
//
/**********************************************************************
 Project:    iOS Project
 Name   :    NIU CS Directory
 Authors:    Jyostna Ankam and Tejasvi Srigiriraju
 DueDate:    April 24th 2017
 Purpose:    This app is helpful for NIU CS students to look on all the details about CS department in NIU
 It gives details like professors list (office timings, prof's education, email id ), CS research interests, TA hours etc in app.
 *********************************************************************/
import UIKit

class TypeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var StaffType: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
