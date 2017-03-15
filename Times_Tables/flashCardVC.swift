//
//  flashCardVC.swift
//  Times_Tables
//
//  Created by Anthony on 8/8/15.
//  Copyright © 2015 aimappdesign. All rights reserved.
//

import UIKit

class flashCardVC: UIViewController {
    @IBOutlet weak var topNumber: UILabel!
    @IBOutlet weak var bottomNumber: UILabel!
    @IBOutlet weak var correctAnswerImage: UIImageView!
    @IBOutlet weak var incorrectAnswerImage: UIImageView!
    @IBOutlet weak var enterAnswerTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var topNumberInt = 0
    var bottomNumberInt = 0
    var correctImage:String?
    var incorrectImage:String?
    var enteredAnswerInt:Int?
    var correctAnswer = 0
    //var correctAnswerArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.topNumber.text = String(topNumberInt)
        self.bottomNumber.text = String(bottomNumberInt)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"chalkBoard.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func determineIfAnswerIsCorrect() {
        enteredAnswerInt = Int(enterAnswerTextField.text!)!
        print(enteredAnswerInt)
        print(correctAnswer)
        enterAnswerTextField.resignFirstResponder()
        
        if enteredAnswerInt == correctAnswer {
            self.correctAnswerImage.image = UIImage(named: "gjRibbon.png")
            self.correctAnswerImage.isHidden = false
            self.incorrectAnswerImage.isHidden = true
            print("Correct answer entered")
        }
        else {
            self.incorrectAnswerImage.image = UIImage(named: "wrongAnswer.png")
            self.incorrectAnswerImage.isHidden = false
            self.correctAnswerImage.isHidden = true
            print("Wrong answer entered")
        }
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkAnswerButtonPressed(_ sender: UIButton) {
        self.view.reloadInputViews()
        if enterAnswerTextField.text == "" {
            print("No value entered")
        }
        else {
        determineIfAnswerIsCorrect()
        }
    }
}
