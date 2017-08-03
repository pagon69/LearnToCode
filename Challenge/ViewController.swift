//
//  ViewController.swift
//  Challenge
//
//  Created by Andy Alleyne on 7/21/17.
//  Copyright © 2017 Andy Alleyne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayScreen.text = ""
        miniDisplayScreen.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var miniDisplayScreen: UILabel!
    
    @IBOutlet weak var displayScreen: UILabel!
    
    //system variables
    var calculorStorageOne = 0.0
    var calculorStorageTwo = 0.0
    var amIStillPressingDigits = true
    var functionSent = ""
    
    
    //saves the digit pressed
    @IBAction func digitsPressed(_ sender: UIButton) {
        let theCurrentDigit = sender.currentTitle
        amIStillPressingDigits = true
        displayScreen.text! = displayScreen.text! + theCurrentDigit!
        miniDisplayScreen.text! = miniDisplayScreen.text! + theCurrentDigit!
    }
    
    //saves the function pressed
    @IBAction func mathFunctions(_ sender: UIButton) {
        amIStillPressingDigits = false
        if displayScreen.text == "" {
            displayScreen.text = "0"
            miniDisplayScreen.text! = miniDisplayScreen.text! + displayScreen.text! + " "
        }else {
        calculorStorageOne = Double(displayScreen.text!)!
        displayScreen.text = ""
        functionSent = sender.currentTitle!
        miniDisplayScreen.text! = miniDisplayScreen.text! + functionSent + " "
        }
    }
    
    //handles special functions
    @IBAction func specialFunctions(_ sender: UIButton) {
        amIStillPressingDigits = false
        calculorStorageOne = Double(displayScreen.text!)!
        functionSent = sender.currentTitle!
        
        switch functionSent {
        case "+/-":
            displayScreen.text = String (calculorStorageOne * -1 )
            
        case "%":
            displayScreen.text = String (calculorStorageOne / 100 )
            
        case ".":
            displayScreen.text = String (calculorStorageOne)
            
        default:
            displayScreen.text = "Error"
        }
        
    }
    
    // calculates the value of work done
    @IBAction func calculateValue(_ sender: UIButton) {
        if displayScreen.text == ""{
            displayScreen.text = "0"
            functionSent = "0"
            miniDisplayScreen.text! = "0"
        }else {
            
        calculorStorageTwo = Double(displayScreen.text!)!
        amIStillPressingDigits = false
            
        switch functionSent {
        case "+":
            displayScreen.text = String(calculorStorageOne + calculorStorageTwo)
            miniDisplayScreen.text! = miniDisplayScreen.text! + " = " + displayScreen.text!
        case "-":
            displayScreen.text = String(calculorStorageOne - calculorStorageTwo)
            miniDisplayScreen.text! = miniDisplayScreen.text! + " = " + displayScreen.text!
        case "X":
            displayScreen.text = String(calculorStorageOne * calculorStorageTwo)
            miniDisplayScreen.text! = miniDisplayScreen.text! + " = " + displayScreen.text!
        case "/":
            if calculorStorageTwo == 0 {
                displayScreen.text = "Not a Number"
                miniDisplayScreen.text! = miniDisplayScreen.text! + "Divide by 0"
            }
            else{
            displayScreen.text = String(calculorStorageOne / calculorStorageTwo)
            miniDisplayScreen.text! = miniDisplayScreen.text! + " = " + displayScreen.text!
            }
            
        default:
            displayScreen.text = "0"
        }
        }
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        displayScreen.text = ""
        calculorStorageOne = 0.0
        calculorStorageOne = 0.0
        amIStillPressingDigits = false
        miniDisplayScreen.text = ""
    }
    
}

