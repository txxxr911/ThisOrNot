//
//  MainViewControllerBindings.swift
//  ThisOrThat
//
//  Created by Victor on 21.04.2022.
//

import Foundation

extension MainViewController {
  
    func bind() {
        bindStartButton()
        bindCatalogButton()
        bindRulesButton()
    }
    
    fileprivate func bindStartButton() {
        gameStartButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
    
    fileprivate func bindCatalogButton() {
        catalogButton.addTarget(self, action: #selector(catalogButtonPressed), for: .touchUpInside)
    }
    
    fileprivate func bindRulesButton() {
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    }
}
