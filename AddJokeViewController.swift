//
//  AddJokeViewController.swift
//  Joker2
//
//  Created by Kameron Haramoto on 2/1/17.
//  Copyright © 2017 Kameron Haramoto. All rights reserved.
//

import UIKit

class AddJokeViewController: UIViewController, UITextFieldDelegate {
    
    var numJokes: Int = 0
    var newJoke = Joke()
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextFieldAnswer: UITextField!
    
    @IBAction func CancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //var newJoke = Joke!
        newJoke.firstLine = self.TextField1.text!
        newJoke.secondLine = self.TextField2.text!
        newJoke.thirdLine = self.TextField3.text!
        newJoke.answerLine = self.TextFieldAnswer.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TextField1.delegate = self
        TextField2.delegate = self
        TextField3.delegate = self
        TextFieldAnswer.delegate = self
        
        TitleLabel.text = "Enter New Joke #\(numJokes)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
