//
//  AboutCSViewController.swift
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

class AboutCSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we load Aboutus pdf in webview. getting AboutUS.pdf to myPdf
        let myPdf = Bundle.main.url(forResource: "AboutUS", withExtension: "pdf")
        //initiate to url request
        let urlRequest = URLRequest(url: myPdf!)
        //load url request
        aboutview.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Web view for author
    @IBOutlet weak var aboutview: UIWebView!

}
