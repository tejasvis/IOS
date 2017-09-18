//
//  AboutAuthorViewController.swift
//  NIUDirectory
//
//  Created by  on 4/23/17.
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

class AboutAuthorViewController: UIViewController {

    //ti display author web view
    @IBOutlet weak var authorMobileView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting initial view of page to jyostna Ankam profile
        let path = Bundle.main.path(forResource: "JyostnaHTML/index", ofType: "html")!
        let data:NSData = NSData(contentsOfFile:path)!
        let html = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
        
        // Load the webView outlet with the content of the index.html file
        authorMobileView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var authorSegmentControl: UISegmentedControl!
    
    //Action for segmented control, It has 2 options for 2 authors, view changes according to option selected
    @IBAction func authorSegmCtrl(_ sender: UISegmentedControl) {
        
        var authorName : String!
        var myPath: String!
        
        //set index
        let segIndex = sender.selectedSegmentIndex
        switch segIndex {
        case 0:
            authorName = "Jyostna Ankam"
            myPath = "JyostnaHTML/index"
            
        default:
            authorName = "Tejasvi Srigiriraju"
             myPath="TejasviHTML/index"
            
        }
        
        //path for html document
        let path = Bundle.main.path(forResource: myPath, ofType: "html")!
        let data:NSData = NSData(contentsOfFile:path)!
        let html = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
        
        // Load the webView outlet with the content of the index.html file
        authorMobileView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
        
        
    }
}
