//
//  TableViewCell.swift
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

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //super.awakeFromNib()
    }
    
    //outlet for email button
    @IBOutlet weak var email: UIButton!
    //outlet for website button
    @IBOutlet weak var website: UIButton!
    //outlet for professor name label
    @IBOutlet weak var ProfName: UILabel!
    //outlet for professor hours label
    @IBOutlet weak var ProfHours: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ProfHours.text=nil
        //set cell to initial state here, reset or set values, etc.
    }

}
