//
//  ViewController.swift
//  Roshambo
//
//  Created by Stevenson Michel on 6/7/15.
//  Copyright (c) 2015 Stevenson Michel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rockButton: UIButton!
    
    
    @IBOutlet weak var paperButton: UIButton!
    
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    var currentSelection: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "resultView" {
            let controller = segue.destinationViewController as! ResultViewController
            
            controller.userSelection = getSelection(sender as! UIButton)
        }
    }
    
    @IBAction func rock(sender: UIButton) {
        let resultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        resultViewController.userSelection = getSelection(sender)
        
        
        presentViewController(resultViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func paper(sender: UIButton) {
        performSegueWithIdentifier("resultView", sender: sender)
    }
    
    
    @IBAction func scissors(sender: UIButton) {
        performSegueWithIdentifier("resultView", sender: sender)
    }
    
    private func getSelection(sender: UIButton) -> String {
        if sender == rockButton {
            return "Rock"
        }
        
        if sender == paperButton {
            return "Paper"
        }
        
        return "Scissors"
    }

}

