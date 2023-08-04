//
//  StartGameLayout.swift
//  ThisOrThat
//
//  Created by Victor on 22.04.2022.
//

import Foundation
import UIKit
import SnapKit

extension StartGameViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutBackgroundImage()
        layoutNavigationBar()
        //layoutBackButton()
        layoutStartButton()
        layoutTableView()
    }
    
    
    
    fileprivate func layoutBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func layoutNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        viewTitle.text = "Игроки"
        viewTitle.textColor = .white
        viewTitle.textAlignment = .center
        viewTitle.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 36)
        navigationBar.addSubview(viewTitle)
        viewTitle.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(39)
            make.top.equalTo(navigationBar).inset(3)
            make.centerX.equalTo(navigationBar)
        }
    }
    
//    fileprivate func layoutBackButton() {
//        view.addSubview(backButton)
//        backButton.snp.makeConstraints {
//            backButton.setImage(UIImage(named: "back_button_arrow"), for: .normal)
//            $0.width.height.equalTo(40)
//            $0.leading.equalToSuperview().offset(16)
//            $0.centerY.equalTo(titleImage.snp.centerY)
//        }
//    }
    

    
    
    fileprivate func layoutStartButton() {
        view.addSubview(startButtonImage)
        view.addSubview(startLabel)
        view.addSubview(startButton)
        startButtonImage.image = UIImage(named: "startButton")
        
        
        startButtonImage.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        startButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        startLabel.text = "Начать"
        startLabel.textColor = .white
        startLabel.textAlignment = .center
        startLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)

        startLabel.snp.makeConstraints { make in
            make.edges.equalTo(startButtonImage)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.bottom.equalTo(startButtonImage)
        }
        

    }
    
    fileprivate func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).inset(0)
            make.bottom.equalTo(startButton.snp.top).offset(-20)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
    }
}
