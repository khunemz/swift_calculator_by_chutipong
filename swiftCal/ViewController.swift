//
//  ViewController.swift
//  swiftCal
//
//  Created by Chutipong Roobklom on 8/28/16.
//  Copyright © 2016 Chutipong Roobklom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation : String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }

    
    @IBOutlet var outputLbtl: UILabel!
    
    var runningNumber = ""
    var leftVarStr = ""
    var rightVarStr = ""
    var currentOperation : Operation = Operation.Empty
    var result : String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func numberPressed(btn: UIButton!){
        //Todo : sound effects goes here !!
        
        runningNumber += "\(btn.tag)"
        outputLbtl.text = runningNumber
    }
    
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }


    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
   
    @IBAction func onAddPress(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    
    @IBAction func onClearPressed(sender: AnyObject) {
        processOperation(Operation.Empty)
    }
    
    func processOperation (op : Operation ) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightVarStr = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftVarStr)! * Double(rightVarStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVarStr)! / Double(rightVarStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftVarStr)! + Double(rightVarStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftVarStr)! - Double(rightVarStr)!)"
                }
                
                // Store result to next operand
                leftVarStr = result
                outputLbtl.text = result
            }
            
           
             currentOperation = op
            
        } else {
            leftVarStr = runningNumber
            runningNumber.removeAll()
            outputLbtl.text = runningNumber
            currentOperation = op
        }
    }
    
    
    
}

