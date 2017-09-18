//
//  OfficehoursViewController.swift
//  NIUDirectory
//
//  Created by Ios on 4/11/17.
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

class OfficehoursViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // we load pdf in webview.
        let myPdf = Bundle.main.url(forResource: "faculty_hours", withExtension: "pdf")
        
        //initiate to url request
        let urlRequest = URLRequest(url: myPdf!)
        
        //load url request
        hoursView.loadRequest(urlRequest)

    }

    //Use segmented control, which has 2 options - 1 for faculty hours, 1 for TA hours
    @IBAction func Officehours(_ sender: UISegmentedControl) {
        
        
        let myUrl : String!
        //get index
        let segIndex = sender.selectedSegmentIndex
        
        //swich the page webview according to index selected
        switch segIndex {
        case 0:
            myUrl = "faculty_hours"
        case 1:
            myUrl = "TA_Hours"
        default:
            myUrl = "faculty_hours"
        }
        let myPdf = Bundle.main.url(forResource: myUrl, withExtension: "pdf")
         //initiate to url request
        let urlRequest = URLRequest(url: myPdf!)
          //load url request
        hoursView.loadRequest(urlRequest)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var hoursView: UIWebView!
}
