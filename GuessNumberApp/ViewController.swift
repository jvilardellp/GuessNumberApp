//
//  ViewController.swift
//  GuessNumberApp
//
//  Created by Jaume Vilardell Pons on 06/01/2020.
//  Copyright © 2020 jvp. All rights reserved.
//

// Add text to check out that the modifications are displayed using the version viewer.

import UIKit

class ViewController: UIViewController {
    
    // VARIABLES
    var random = ""
    var attempts = 0
    
    // CONNECTRORS
    @IBOutlet weak var numberTXT: UITextField!
    @IBOutlet weak var numberAttemptsLabel: UILabel!
    @IBOutlet weak var messageAttemptsLabel: UILabel!
    @IBAction func validateButton(_ sender: Any) {
        // Task to do when the button is pressed
        if numberTXT.text == random {
            messageAttemptsLabel.text = "Congratulations! The number chosen is correct."
            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            
            showAlertCorrectNumber()
        }
        else {
            messageAttemptsLabel.text = "Wrong number! Try again."
            if attempts == 1 {
                self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                
                showAlertWrongNumber()
            }
            else {
                attempts -= 1
                numberAttemptsLabel.text = String(attempts)
                messageAttemptsLabel.text = "Try again, please"
                numberTXT.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        setValues() // Printing on console the random number
    }
    
    func showAlertCorrectNumber() {
        let alert = UIAlertController(title: nil, message: "You are the best!!!\n Game Over", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Play again!", style: .default) { (UIAlertAction) in self.setValues() }
        
        alert.addAction(playAgain)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showAlertWrongNumber() {
        let alert = UIAlertController(title: nil, message: "Game Over", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Play again!", style: .default) { (UIAlertAction) in self.setValues() }
        
        alert.addAction(playAgain)
        self.present(alert, animated: true, completion: nil)
    }

    func setValues() {
        // Generating the random number
        // The parameter of random function is the upper limit
        random = String(arc4random_uniform(10))
        
        // Printing on console the random number
        print(random)
        
        // Assigning values
        numberTXT.text = ""
        attempts = 5
        numberAttemptsLabel.text = String(attempts)
        messageAttemptsLabel.text = "Insert a number from 0 to 9"
        
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
}

