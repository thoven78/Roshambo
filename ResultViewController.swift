//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Stevenson Michel on 6/15/15.
//  Copyright (c) 2015 Stevenson Michel. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var userSelection: String!
    
    var opponentSelection: String!
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBOutlet weak var imageResult: UIImageView!

    func randomImageValue() -> Int {
        
        let randomValue = 1 + arc4random() % 3
        
        return Int(randomValue)
    }
    
    override func viewWillAppear(animated: Bool) {
        let choices = ["Rock", "Paper", "Scissors"]
        
        let randomIndex = Int(arc4random() % 3)
        
        opponentSelection = choices[randomIndex]
        
        displayResult()
    }

    private func displayResult() {
        var imageName: String
        var didWin: Bool = false
        
        var text: String
        
        let machup = "\(userSelection) vs. \(opponentSelection)"
        
        if userSelection == opponentSelection {
            imageResult.image = UIImage(named: "tie")
            
            result.text = "\(machup): it's a tie!"
            
            return
        }
        
        switch(userSelection) {
        case "Rock":
            didWin = opponentSelection == "Scissors"
        case "Paper":
            didWin = opponentSelection == "Rock"
        default:
            didWin = opponentSelection == "Paper"
            
        }
        
        if didWin {
            text = "You won! \(machup)"
            imageName = "\(userSelection)-\(opponentSelection)".lowercaseString
        } else {
            text = "You lost \(machup)"
            imageName = "\(opponentSelection)-\(userSelection)"
        }
        
        // Update the UI
        result.text = text
        imageResult.image = UIImage(named: imageName)
        
    }
    
    
    @IBAction func playAgain(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
