//
//  MainViewControllerLayout.swift
//  ThisOrThat
//
//  Created by Victor on 21.04.2022.
//

import Foundation
import UIKit
import SnapKit

extension MainViewController {
    
    fileprivate func layoutButtons() {
        view.addSubview(gameStartButton)
        gameStartButton.setTitle("НАЧАТЬ", for: .normal)
        gameStartButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        gameStartButton.titleLabel?.textAlignment = .center
        gameStartButton.backgroundColor = UIColor(red: 39/225, green: 174/255, blue: 96/255, alpha: 1)
        gameStartButton.layer.cornerRadius = 11
        gameStartButton.layer.shadowColor =  UIColor(red: 0.085, green: 0.538, blue: 0.277, alpha: 1).cgColor
        gameStartButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        gameStartButton.layer.shadowOpacity = 1
        gameStartButton.layer.shadowRadius = 0
        gameStartButton.layer.masksToBounds = false
        gameStartButton.snp.makeConstraints { make in
            make.width.equalTo(195)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage).inset(260)
        }
        
        
        view.addSubview(catalogButton)
        catalogButton.setTitle("КАТАЛОГ", for: .normal)
        catalogButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        catalogButton.backgroundColor = UIColor(red: 242/255, green: 153/255, blue: 74/255, alpha: 1)
        catalogButton.layer.cornerRadius = 11
        catalogButton.layer.shadowColor =  UIColor(red: 215/255, green: 122/255, blue: 39/255, alpha: 1).cgColor
        catalogButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        catalogButton.layer.shadowOpacity = 1
        catalogButton.layer.shadowRadius = 0
        catalogButton.layer.masksToBounds = false
        catalogButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gameStartButton).inset(62)
            make.width.equalTo(195)
            make.height.equalTo(44)
        }
        
        
        view.addSubview(rulesButton)
        rulesButton.setTitle("ПРАВИЛА", for: .normal)
        rulesButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        rulesButton.backgroundColor = UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)
        rulesButton.layer.cornerRadius = 11
        rulesButton.layer.shadowColor =  UIColor(red: 35/255, green: 132/255, blue: 187/255, alpha: 1).cgColor
        rulesButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        rulesButton.layer.shadowOpacity = 1
        rulesButton.layer.shadowRadius = 0
        rulesButton.layer.masksToBounds = false
        rulesButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(catalogButton).inset(62)
            make.width.equalTo(195)
            make.height.equalTo(44)
        }
    }
    
    fileprivate func layoutBackground() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
    }
    
    fileprivate func layoutLogo() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "logo")
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(235)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(155)
        }
    }
    
    override func viewDidLayoutSubviews() {
        layoutBackground()
        layoutLogo()
        layoutButtons()
    }
    
}
