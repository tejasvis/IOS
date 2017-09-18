//
//  DetailViewController.swift
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
import MessageUI

class DetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var sentname:String!
    var sentedu:String!
    var sentemail:String!
    var sentwebsite:String!
    var senthours:String!
    var sentdesignation:String!
    

   // @IBOutlet weak var profNameLabel: UILabel!
    
    @IBAction func websiteProf(_ sender: UIButton) {
        
    }
    @IBAction func homeButton(_ sender: UIButton) {
      _ = navigationController?.popToRootViewController(animated: true)
    
}
    
   
    @IBOutlet weak var profNameLabel: UILabel!
    
 
    @IBAction func profEmailBtn(_ sender: UIButton) {
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        let toRecipients = [sentemail]
        
        mailComposeVC.setToRecipients(toRecipients as? [String])
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeVC, animated: true, completion: nil)
    }
    }
    @IBOutlet weak var profEduview: UITextView!
   
    
    @IBOutlet weak var profEmailBtnOutlet: UIButton!
 
    

    @IBOutlet weak var profOfcView: UITextView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CS.jpeg")!)
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.insertSubview(blurEffectView, at: 0)
*/
        //Load data into labels.
     if (!(profNameLabel.text?.isEmpty)!){
        profNameLabel.text = sentname
            profNameLabel.sizeToFit()
        }
        
       
        profEduview.text = sentedu
        
         profEmailBtnOutlet.setTitle(sentemail, for: .normal)
        
        
        
        //This method call will automatically expand the label size based on the content
        profEmailBtnOutlet.sizeToFit()
        profEduview.sizeToFit()
       
        
        
        //hours null case handling. If office hours are not mentioned, hours label and text view will be shown as not available
        if senthours != "NA"
        {
            profOfcView.text = senthours
            
           
        }
        else{
            profOfcView.text = "Not Available"
          
        }
        
        
         profOfcView.sizeToFit()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view .
        if(segue.identifier == "webView"){
            if let webVC:facultyWebsiteViewController = segue.destination as? facultyWebsiteViewController {
                
                if sentwebsite == "NA"{
                    let alert = UIAlertController(title: "Website Details", message: "No website found", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                webVC.websiteURL = sentwebsite
                webVC.profNameTitle = sentname
                }
            }
        }

    }
 

}
