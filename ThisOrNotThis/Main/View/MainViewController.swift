//
//  MainViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class MainViewController: UIViewController, MainViewInput {
    var output: MainViewOutput!
    
    let backgroundImage = UIImageView()
    let logoImage = UIImageView()
    let gameStartButton = UIButton()
    let catalogButton = UIButton()
    let rulesButton = UIButton()
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        output.startbuttonPressed()
    }
    
    @IBAction func catalogButtonPressed(_ sender: UIButton) {
        
        output.catalogButtonPressed()
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
        
        output.rulesButtonPressed()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        bind()
    }
}

// MARK: - Configure
extension MainViewController {
    
}

// MARK: View Input
extension MainViewController {

}

// MARK: Button Action
extension MainViewController {
    
}
