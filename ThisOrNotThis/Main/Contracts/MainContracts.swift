//
//  MainContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

// Module Input
protocol MainModuleInput {
    
}

// Module Output
protocol MainModuleOutput: ModuleOutput {
    
}

// View Input
protocol MainViewInput: AnyObject {
}

// View Output
protocol MainViewOutput: AnyObject {
    func viewDidLoad()
    func startbuttonPressed()
    func catalogButtonPressed()
    func rulesButtonPressed()
}

// Interactor
protocol MainInteractorInput {
    func prepareQuestions()
}

// Router
protocol MainRouterProtocol: AlertRoutable {

    func showGameStartView()
    func showCatalogView()
    func showRulesView()
}
