//
//  StartGamePresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation
import UIKit

class StartGamePresenter: BasePresenter<StartGameInteractorInput, StartGameRouterProtocol>, StartGameModuleOutput {
    var players: [Player] { interactor.players }
    
    
    // MARK: - Weak properties
    weak var view: StartGameViewInput?
}

// MARK: Private
extension StartGamePresenter {
    
}

// MARK: Module Input
extension StartGamePresenter: StartGameModuleInput {
    
}

// MARK: View Output
extension StartGamePresenter: StartGameViewOutput {
    func addPlayer() {
        interactor.addPlayer()
    }
    
    func didRemoveItem(player: Player) {
        interactor.removePlayer(player: player)
    }
    
    func changeSexButtonDidTap(player: Player) {
        interactor.changeSex(player: player)
    }
    
    func didTapBackButton() {
        
    }
    
    func startButtonPressed() {
        do {
            try validatePlayers()
        }
        
        catch {
            print(error)
        }

    }
    
    func validatePlayers() throws {
        switch interactor.players.count {
            
        case 1:
            let alert = UIAlertController(title: "Решили поиграть", message: "Но у вас не набралась большая компания? \n Ну что же, в таблице результатов вы всегда будете на первом месте", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Отлично", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    self.interactor.save()
                    self.router.navigateToCatalog(players: self.players)
                    
                
                default:
                    break;
                }
            }))
            view?.showAlert(alert: alert)
            
            
        case 2:
            let alert = UIAlertController(title: "Решили поиграть", message: "Но у вас не набралась большая компания? Ну что же, в таблице результатов вы всегда будете на первом месте", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Отлично", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    self.interactor.save()
                    self.router.navigateToCatalog(players: self.players)
                    
                default:
                    break;
                    
                }
            }))
            view?.showAlert(alert: alert)
            
            default:
            self.interactor.save()
            self.router.navigateToCatalog(players: self.players)
        }
        
        
        if interactor.players.count == 1 {
            
        }
    }
    
    func viewDidLoad() {
        view?.set(title: "StartGame")
    }
}
