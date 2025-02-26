//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true) // when we use override function of view .It is good practise to use super() function.
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        let titleText = Constants.appName
        var delayPerLetter = 0.0
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * delayPerLetter, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            delayPerLetter += 1
        }
    }
}
