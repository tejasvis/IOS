// Author: Kai Rush
// Date: 2/2/2017

// Purpose:
// Write Simple swift functions to accept various
// number of arguments, including zero, one and two
// arguments.

import UIKit


// This function accepts zero argument
func greeting1 () {
    print ("Welcome to CSCI 321/521")
}
greeting1()


// This functions accepts one String argument
func greeting2 (msg: String) {
    print ("\(msg)")
}
greeting2("Happy Valentine's Day!")


// This function accepts two integers and returns
// the sum of the two integers.
func add(a: Int, b: Int) -> Int {
    return a+b
}
let result = add (8, b: 12)
print("The return value from the add function = \(result)")


// This function accepts two arguments.
// Argument 1 = amount of typed double
// Argument 2 = a discount rate of typed double
// It computes and returns a discounted amount.
func computeTotal (amount: Double, rate: Double) -> Double {
    return (amount - (amount*rate))
}

let subTotal = 125 // Int
let discount = 0.20
let total = computeTotal(Double(subTotal), rate: discount)
print ("The total sales after the discount is \(total)")
