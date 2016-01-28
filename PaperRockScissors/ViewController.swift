//
//  ViewController.swift
//  PaperRockScissors
//
//  Created by Klaudyna Marciniak on 20.11.2015.
//  Copyright © 2015 Klaudyna Marciniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var controller: OutcomeViewController!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        controller = segue.destinationViewController as! OutcomeViewController
        controller.computerBet = self.computerBet()
        
        if sender as! NSObject == paperButton {
            controller.playerBet = "paper"
        }
        else {
           controller.playerBet = "rock" 
        }
    }
    
    

    @IBAction func paperIsChosen(sender: AnyObject) {
        performSegueWithIdentifier("OutcomeViewController", sender: sender)
    }

    @IBAction func scissorsAreChosen(sender: AnyObject) {
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("OutcomeViewController") as! OutcomeViewController
        controller.computerBet = self.computerBet()
        controller.playerBet = "scissors"
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func rockIsChosen(sender: AnyObject) {
        
    }
    
    
    func computerBet()->String {
        let randomNumber = 1 + arc4random() % 3
        switch randomNumber {
        case 1:
            return "paper"
            
        case 2:
            return "rock"
            
        default:
            return "scissors"
        }
    }
}

