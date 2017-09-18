//
//  TableViewController.swift
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


class TableViewController: UITableViewController,MFMailComposeViewControllerDelegate {
    
    //MARK: prepare variables to hold data from TypeTableViewController
    
    
    var existingFacultyObject = [facultyList]() // Instantial an object of the Recoomendations class
    var searchObject = [facultyList] () //Object to hold the searched results
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         readPropertyList()
       
        
        searchObject = existingFacultyObject
        
        //MARK: SEARCH BAR RELATED
        searchController.searchResultsUpdater = self as UISearchResultsUpdating //This will let the class be informed of any text changes in the search bar
        searchController.dimsBackgroundDuringPresentation = false   //This will not let the view controller get dim when a search is performed.
        definesPresentationContext = true   //this will make sure that the search bar will not be active in other screens
        tableView.tableHeaderView = searchController.searchBar  //This will add the search bar to table header view

    }
    

    
    //This function returns the filtered data
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        searchObject = existingFacultyObject.filter { item in
            return item.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    //This function assigns values to each variable of the plist

    func readPropertyList(){
     
        
        let path = Bundle.main.path(forResource: "facultyList", ofType: "plist")!
        let fListArray:NSArray = NSArray(contentsOfFile: path)!
        
        for dict in fListArray{
            let name = (dict as! NSDictionary)["name"] as! String
            let designation = (dict as! NSDictionary)["designation"] as! String
            let education = (dict as! NSDictionary)["education"]  as! String
            let email = (dict as! NSDictionary)["email"] as! String
            let website = (dict as! NSDictionary)["website"] as! String
            let hours = (dict as! NSDictionary)["hours"] as! String
            let category = (dict as! NSDictionary)["category"] as! String
            
            //appending the values to the faculty object
            
            existingFacultyObject.append(facultyList(name: name, designation: designation, education: education, email: email, website: website, hours: hours, category: category))
            
        }//for end
    }//func end
    

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
        //checking if the control is in search bar or not
        if searchController.isActive && searchController.searchBar.text != "" {
            return searchObject.count
        }
        return existingFacultyObject.count
    }

    var web: String!
    
    //returning each value in cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "CELL",for: indexPath) as! TableViewCell
        var fList:facultyList
      
        //Determine which list to show based on search bar activity
        if searchController.isActive && searchController.searchBar.text != "" {
            fList = searchObject[indexPath.row]
        }
          
        else {
            fList = self.existingFacultyObject[indexPath.row]
        }
        
        //place the attributes value in the cell
        cell.ProfName.text = fList.name
        cell.ProfName.sizeToFit()
        cell.ProfHours.text = fList.hours
        cell.ProfHours.sizeToFit()
        
        //disabling email and website buttons if the value doesnot exists
        if fList.email == "NA" {
            cell.email.isEnabled=false
        }
            // setting up email accounts if the value is present
        else {
            cell.email.tag = indexPath.row
            cell.email.addTarget(self, action: #selector(TableViewController.sendEmail), for: .touchUpInside)
        }
        
        
        if fList.website == "NA" {
            cell.website.isEnabled=false
        }
        else {
        cell.website.tag=indexPath.row
        cell.website.addTarget(self, action: #selector(TableViewController.websiteProf), for: .touchUpInside)
        }
        
       
        
        return cell
    
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  self.performSegue(withIdentifier: "webView", sender: self)
       // websiteProf(indexPath.row)
        
    }

   // composing and sending email is handled in this function action
    @IBAction func sendEmail(_ sender: UIButton) {
        var fList:facultyList
        
        
        //Determine which list to show based on search bar activity
        if searchController.isActive && searchController.searchBar.text != "" {
            fList = searchObject[sender.tag]
        }
            
        else {
            fList = self.existingFacultyObject[sender.tag]
        }
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        let toRecipients = [fList.email]
        
        mailComposeVC.setToRecipients(toRecipients as? [String])
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeVC, animated: true, completion: nil)

    }
    }
    
    
    //this function redirects to website details if it is available
    @IBAction func websiteProf(_ sender: UIButton) {
        
        var fList:facultyList
        if searchController.isActive && searchController.searchBar.text != "" {
            fList = searchObject[sender.tag]
        }
            
        else {
            fList = self.existingFacultyObject[sender.tag]
        }

        
        let facultywebview = self.storyboard?.instantiateViewController(withIdentifier: "facultyweb") as! facultyWebsiteViewController
        facultywebview.websiteURL = fList.website
        self.navigationController?.pushViewController(facultywebview, animated: true)

    }
      
    }





// This class extension allows the table view controller to respond to search bar by implementing UISearchResultsUpdating.
extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}


