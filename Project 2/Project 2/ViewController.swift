//
//  ViewController.swift
//  Project 2
//
//  Created by Thomas Wessel on 8/4/20.
//  Copyright © 2020 Team Creative Name. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //get references to the buttons presented in the GUI
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    //array of the possible different countries
    var countries = [String]()
    
    //keep track of the user's score - starts at 0
    var score = 0

    //keep track of which button is the correct answer
    var correctAnswer = 0

    //keep track of the current question they are on
    var currentQuestionNum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add a list of valid countries to our country array
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")

        //apply a border around the three buttons
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        //change border color to light gray
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor


        //start game loop
        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction!){
        //increment question counter
        currentQuestionNum += 1

        //we should shuffle the array each time this method is called so we dont have the same flags each time
        countries.shuffle()

        //generate a new correct answer
        correctAnswer = Int.random(in: 0...2)

        //set view controller title to the correct answer
        title = "Score: \(score) Find: " + countries[correctAnswer].uppercased()

        //set images
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    func restartGame(action: UIAlertAction){
        //reset all globals to default values
        score = 0
        correctAnswer = 0
        currentQuestionNum = 0

        //restart game loop
        askQuestion(action: nil)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if(sender.tag == correctAnswer){
            title = "Correct"
            score += 1
        }else{
            title = "Incorrect"
            score -= 1
        }

        if(currentQuestionNum == 10){
            let ac = UIAlertController(title: title, message: "Final Score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartGame))
            present(ac, animated: true)
        }else{
            let ac = UIAlertController(title: title, message: "That was the flag of \(countries[sender.tag].uppercased()).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }


    }
    




}

