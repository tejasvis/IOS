//
//  AboutCSViewController.swift
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

class ContactCSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // this function applies for calling a phone number
    @IBAction func CallAction(_ sender: UIButton) {
        
        let myURL:NSURL = URL(string: "tel://18157536936")! as NSURL
        UIApplication.shared.open(myURL as URL, options: [:], completionHandler: nil)
        
        // Display the simple alert since we cannot test the above
        // code on the simulator
        let alertController = UIAlertController(title: "Calling..", message: "1(815)753-6936", preferredStyle: .alert)
        
        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
            
            (alert: UIAlertAction!) -> Void in
        })
        alertController.addAction(dismissButton)
        self.present(alertController, animated: true, completion: nil)

    }

    //@IBOutlet weak var callAction: UIButton!
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let authorVC = segue.destination as! AboutAuthorViewController
        
    }*/
    

}
