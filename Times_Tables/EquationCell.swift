//
//  EquationCell.swift
//  Times_Tables
//
//  Created by Anthony on 8/7/15.
//  Copyright © 2015 aimappdesign. All rights reserved.
//

import UIKit

class EquationCell: UITableViewCell {
    
//MARK: IBOutlets
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var answerStatusImage: UIImageView!
    @IBOutlet weak var solveLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
//MARK: PROPERTIES
    let greenColor = UIColor(red: 86/255, green: 240/255, blue: 70/255, alpha: 1)
    let blueColor = UIColor(red: 60/255, green: 187/255, blue: 243/255, alpha: 1)
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.solveLabel.textColor = greenColor
        self.answerLabel.textColor = blueColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func answerCorrect(_ isCorrect: Bool) {
        if isCorrect {
            self.answerStatusImage.image = UIImage(named: "correct.png")
        }
        else {
            self.answerStatusImage.image = UIImage(named: "wrong.png")
        }
    }
    
    func setCell (_ sliderValue: Int, currentIndex: Int, calculatedValue: Int, switchStatus:Bool) {
        self.equationLabel.text = "\(sliderValue) x \(currentIndex)"
        
        if switchStatus == true {
            self.answerLabel.text = "="
            self.answerLabel.isHidden = false
            self.solveLabel.text = String(calculatedValue)
        }
        else {
            self.answerLabel.text = "?"
            self.solveLabel.text = "Solve"
        }
    }
}
