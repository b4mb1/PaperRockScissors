//
//  OutcomeViewController.swift
//  PaperRockScissors
//
//  Created by Klaudyna Marciniak on 20.11.2015.
//  Copyright © 2015 Klaudyna Marciniak. All rights reserved.
//

import UIKit

class OutcomeViewController: UIViewController {

    @IBOutlet weak var outcomeImage: UIImageView!
    @IBOutlet weak var outcomeText: UILabel!
    var computerBet : String?
    var playerBet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("\(self.computerBet)")
        print("\(self.playerBet)")
        if let computerBet = self.computerBet, playerBet = self.playerBet{
            whoWins(computerBet, playerBet: playerBet)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dimissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setWinnerLoserOutputVariables(outcome: Int, matches: String?) {
        switch outcome {
        case 1:
            self.outcomeText.text = "You win!"
        case 0:
            self.outcomeText.text = "Sorry to say that, but you loose.."
        default:
            self.outcomeImage.image = UIImage(named: "itsATie")
            self.outcomeText.text = "Tie"
        }
        if (matches  != nil) {
            switch matches! {
            case "paperCoversRock":
                self.outcomeImage.image = UIImage(named: "PaperCoversRock")
            case "rockCrushesScissors":
                self.outcomeImage.image = UIImage(named: "RockCrushesScissors")
            default:
                self.outcomeImage.image = UIImage(named: "ScissorsCutPaper")
            }
        }
    }
    
    
    func whoWins(computerBet: String,playerBet: String) {
        let winningSymbol:String
        let story: String
        
        if (computerBet == playerBet) {
            setWinnerLoserOutputVariables(2, matches: nil)
        }
        else {
            if (computerBet != "scissors" && playerBet != "scissors") {
                winningSymbol = "paper"
                story = "paperCoversRock"
            }
            else if (computerBet != "paper" && playerBet != "paper") {
                winningSymbol = "rock"
                story = "rockCrushesScissors"
            }
            else {
                winningSymbol = "scissors"
                story = "scissorsCutPaper"
            }
            // up to here we know what was the winning symbol
            if (computerBet == winningSymbol) {
                // we know computer wins
                setWinnerLoserOutputVariables(0, matches: story)
            }
            else {
                // we know human has won
                setWinnerLoserOutputVariables(1, matches: story)
            }
        }
    }
}
