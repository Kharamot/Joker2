//
//  ViewController.swift
//  Joker2
//
//  Created by Kameron Haramoto on 1/20/17.
//  Copyright © 2017 Kameron Haramoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeJokes()
        chooseJoke()
        answerLine.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chooseJoke()
        answerLine.isHidden = true
    }
    
    // Variable declarations.
    var jokesArray = [Joke]()
    var noRepetes: Int? = nil
    var mJokesArray = JokeArray()
    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    @IBOutlet weak var thirdLine: UILabel!
    @IBOutlet weak var answerLine: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    // Controls what happens when button is pressed.
    @IBAction func buttonAction(_ sender: Any) {
        if answerLine.isHidden {
            answerLine.isHidden = false
            buttonOutlet.setTitle("New Joke", for: UIControlState.normal)
        }
        else{
            chooseJoke()
            answerLine.isHidden = true
            buttonOutlet.setTitle("Answer", for: UIControlState.normal)
        }
    }
    
    // Initilizes jokes using the Joke class, and stores them in the array.
    func initializeJokes(){
        let joke = Joke(first: "How many programmers", second: "does it take to", third: "change a lightbulb?", answer: "Zero. That's a hardware problem.")
        self.mJokesArray.list.append(joke)//self.jokesArray.append(joke)
        
        let joke2 = Joke(first: "What prize do", second: "you get for putting", third: "your phone on vibrate?", answer: "The No Bell Prize.")
        self.mJokesArray.list.append(joke2)
        
        let joke3 = Joke(first: "What do you get", second: "when you cross a", third: "stereo and a refrigerator?", answer: "Cool music.")
        self.mJokesArray.list.append(joke3)
        
        let joke4 = Joke(first: "Why do phones ring?", answer: "Because they can't talk.")
        self.mJokesArray.list.append(joke4)
        
        let joke5 = Joke(first: "Hillary Clinton", second: "Spent $1.2 Billion", answer: "And still lost! lol")
        self.mJokesArray.list.append(joke5)
    }
    
    // Chooses random joke from jokeArray. Will not repete a joke.
    func chooseJoke(){
        if(mJokesArray.list.count > 0)
        {
            
            var randomJokeIndex = Int(arc4random_uniform(UInt32(self.mJokesArray.list.count)))
            
            if(mJokesArray.list.count > 1)
            {
                while noRepetes == randomJokeIndex {
                    randomJokeIndex = Int(arc4random_uniform(UInt32(self.mJokesArray.list.count)))
                }
                
                noRepetes = randomJokeIndex
            }
            
            
            firstLine.text = mJokesArray.list[randomJokeIndex].firstLine//jokesArray[randomJokeIndex].firstLine
            secondLine.text = mJokesArray.list[randomJokeIndex].secondLine
            thirdLine.text = mJokesArray.list[randomJokeIndex].thirdLine
            answerLine.text = mJokesArray.list[randomJokeIndex].answerLine
        }
        else{
            firstLine.text = "Empty"
            secondLine.text = "Empty"
            thirdLine.text = "Empty"
            answerLine.text = "Empty"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewJokes")
        {
            let viewJokeViewController = segue.destination as! TableViewController
            viewJokeViewController.jokesArray =  self.mJokesArray
        }
    }

}

