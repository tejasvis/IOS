//
//  facultyWebsiteViewController.swift
//  NIUDirectory
//
//  Created by Ios on 4/12/17.
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

class facultyWebsiteViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    // website labels
    var websiteURL:String!
    var profNameTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetching the URL to open the website
        let myURL = URL(string: websiteURL)
        
        let urlRequest = URLRequest(url: myURL!)
        webView.loadRequest(urlRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
