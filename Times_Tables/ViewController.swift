//
//  ViewController.swift
//  Times_Tables
//
//  Created by Anthony on 8/6/15.
//  Copyright © 2015 aimappdesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: IBOutlets
    @IBOutlet weak var multiplicationTableView: UITableView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var displaySliderValueLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var incorrectAnswersLabel: UILabel!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var sliderOutlet: UISlider!

//MARK: PROPERTIES
    let blueColor = UIColor(red: 60/255, green: 187/255, blue: 243/255, alpha: 1)
    let greenColor = UIColor(red: 86/255, green: 240/255, blue: 70/255, alpha: 1)
    
    let equationVCAcess = EquationCell()
    
    var switchStatus = true
    var sliderNumber = 0
    var currentIndex = 0
    var calculatedValue = 0
//    var correctAnswerArray = []
//    var incorrectAnswerArray = []
//    var thisEquationArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.image = UIImage(named: "background_1.jpg")
        switchOutlet.setOn(true, animated: true)
        switchOutlet.tintColor = blueColor
        switchOutlet.onTintColor = blueColor
        sliderOutlet.tintColor = greenColor
        sliderOutlet.thumbTintColor = blueColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: HELPER FUNCTION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "solveEquationDetail" {
            let flashCardViewC: flashCardVC = segue.destination as! flashCardVC
            let indexPath = self.multiplicationTableView.indexPathForSelectedRow
            flashCardViewC.topNumberInt = sliderNumber
            flashCardViewC.bottomNumberInt = (indexPath?.row)!
            flashCardViewC.correctAnswer = (indexPath?.row)! * Int(round(sliderOutlet.value))
        }
    }
    
//MARK: SLIDER & SWITCH
    
    @IBAction func sliderMovedAction(_ sender: UISlider) {
        sliderNumber = Int(round(sliderOutlet.value))
        print(calculatedValue)
        displaySliderValueLabel.text = String(sliderNumber)
        
        self.multiplicationTableView.reloadData()
    }
    
    @IBAction func switchButtonPressed(_ sender: UISwitch) {
        if switchOutlet.isOn {
            switchStatus = true
        }
        else {
            switchStatus = false
        }
        self.multiplicationTableView.reloadData()
    }
}

//MARK: TABLE SETTINGS
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 26
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell: EquationCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! EquationCell!
        currentIndex = indexPath.row
        calculatedValue = currentIndex * sliderNumber
        
        dataCell.setCell(sliderNumber, currentIndex: currentIndex, calculatedValue: calculatedValue, switchStatus: switchStatus)
        
        if switchOutlet.isOn {
            dataCell.accessoryType = UITableViewCellAccessoryType.none
            self.multiplicationTableView.allowsSelection = false
        }
        else {
            dataCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            self.multiplicationTableView.allowsSelection = true
        }
        return dataCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "solveEquationDetail", sender: self)
    }
}



























