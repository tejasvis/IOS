//
//  ViewController.swift
//  App Name: Stepper
//

/*
 Demo 4:
 Author  : Tejasvi Srigiriraju
 Zid     : z1786900
 Due Date: 02/10/2017
 PURPOSE: To demonstrate the following:
 1.  Create a stepper UI control
 2.  Display the value from the stepper as it increases and decreases.
 2.  Use the stepper value in a computation. 
 */

import UIKit

class ViewController: UIViewController {

    // MARK: PROPERTIES
    let currentQty = 50 as Double // set current OH qty
    var recQty = 0    as Double   // set default for display

    // MARK: OUTLETS
    @IBOutlet weak var currentQtyLabel: UILabel!
    @IBOutlet weak var receivedQtyLabel: UILabel!
    @IBOutlet weak var newQtyLabel: UILabel!
    
    // MARK: ACTIONS
    // As the stepper value changes, the received qty
    // label is assigned and displayed.
    @IBAction func qtyStepperClicked(sender: UIStepper) {
        
        receivedQtyLabel.text = sender.value.description
        
        recQty = Double(receivedQtyLabel.text!)!
        
  
        
    }
    
    // This function is called when the user clicks
    // the Compute New Qty button
    @IBAction func newQtyButtonClicked(sender: UIButton) {
        //calculating the new value by adding the current and received quantity value
        newQtyLabel.text = String(recQty+currentQty)
  
        
    }
    
    // MARK: viewDidLoad
    // After the app launches, display the current OH Qty
    // and the default (0) received qty.
    override func viewDidLoad() {
        super.viewDidLoad()
        //displaying the initial values to the labels
        currentQtyLabel.text = String(currentQty)
        receivedQtyLabel.text = String(recQty)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

