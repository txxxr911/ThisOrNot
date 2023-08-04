//
//  StartGameViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class StartGameViewController: UIViewController, UITableViewDataSource,  StartGameViewInput {
    
    
    var output: StartGameViewOutput!
        
    let backgroundImage = UIImageView()
    let viewTitle = UILabel()
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    
    let newPlayerView = UIView()
    let registeredPlayerMaleView = UIView()
    let registeredPlayerFemaleView = UIView()
    var playerArray = [UIView?](repeating: nil, count: 1)
    
    
    let startButtonImage = UIImageView()
    let startButton = UIButton()
    let startLabel = UILabel()
    
    let newPlayerButton = UIButton()
    
    
    
    
    func newPlayerButtonPressed() {
        print("create new player")
        output.addPlayer()
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.scrollRectToVisible(self.tableView.tableFooterView!.frame, animated: true)
        }
        
    }
    
    
    @objc func startbuttonPressed() {
        print("started")
        output.startButtonPressed()
    }
    
    func removeButtonDidTap(player: Player) {
        output.didRemoveItem(player: player)
        print("pressed cancel")
        tableView.reloadData()
    }
    
    func changeSexButtonDidTap(player: Player) {
        output.changeSexButtonDidTap(player: player)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        bind()
    }
}

// MARK: - Configure


// MARK: View Input
extension StartGameViewController {
    func set(title: String) {
    }
    
    func showAlert(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}

// MARK: Button Action
extension StartGameViewController {
    
}
