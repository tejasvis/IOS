//
//  TypeTableViewController.swift
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

class TypeTableViewController: UITableViewController {

   // @IBOutlet weak var csimage: UIImageView!
    var cellType = [String]()
     var identifiers = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loading the initial view contents in the app
        LoadTypes()
    }
//This function gives the list of all the details of initial view
    func LoadTypes(){
        cellType = ["Faculty and Staff","Office hours","Faculty Research Interest","Facilities","Contact CS@NIU","About CS@ NIU","About App"]
        // this gives the identifiers of each table view option
        identifiers = ["A","B","C","D","F","E","G"]
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the table view cell...
        
        let cell:TypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TYPECELL") as! TypeTableViewCell
        
        //place the staff type in cell
        cell.StaffType.text = cellType[indexPath.row]
            return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //it takes the value from vcname and assigns the corresponding storyboard ID for navigation
        let vcname = identifiers[indexPath.row]
        let viewcontroller = storyboard?.instantiateViewController(withIdentifier: vcname)
        self.navigationController?.pushViewController(viewcontroller!, animated: true)
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "TableView"){
            let tableVC = segue.destination as! TableViewController
            
            //send the type name to table view controller
            
            if let indexpath = self.tableView.indexPathForSelectedRow{
                tableVC.sentname = cellType[indexpath.row]
            }
        }
        
        
    }*/
    

}
