//
//  facultyList.swift
//  CSFaculty_NIU
//
//  Created by Kartheek chintalapati on 30/03/17.
//  Copyright © 2017 Northern Illinois University. All rights reserved.
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

//object to hold faculty details

class facultyList: NSObject {
    
    var name: String!
    var designation: String!
    var education: String!
    var email: String!
    var website: String!
    var hours: String!
    var category: String!
    
    //constructor for faculty object
    init(name: String, designation: String, education: String, email: String, website: String, hours: String, category: String) {
        self.name = name
        self.designation = designation
        self.education = education
        self.email = email
        self.website = website
        self.hours = hours
        self.category = category
    }
    

}
