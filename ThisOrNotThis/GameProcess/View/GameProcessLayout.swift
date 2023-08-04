//
//  GameProcessLayout.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import UIKit

extension GameProcessViewController {
    
    func layout() {
        layoutBackground()
        layoutRoundCounterLabel()
        layoutYouWillPrefferLabel()
        layoutFirstOption()
        layoutFirstOptionLabel()
        layoutOrLabel()
        layoutSecondOption()
        layoutSecondOptionLabel()
        layoutLeadingName()
        layoutLeadingLabel()
        layoutLines()
        layoutResultsButton()
        layoutNextStepButton()
        layoutPlayerTable()
    }
    
    func layoutBackground() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func layoutRoundCounterLabel() {
        view.addSubview(roundCounterLabel)
        roundCounterLabel.text = ""
        roundCounterLabel.textAlignment = .center
        roundCounterLabel.textColor = .white
        roundCounterLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 36)
        
        
        roundCounterLabel.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
    }
    
    func layoutYouWillPrefferLabel() {
        view.addSubview(youWillPrefferLabel)
        youWillPrefferLabel.text = "Вы бы предпочли"
        youWillPrefferLabel.textAlignment = .center
        youWillPrefferLabel.textColor = .white
        youWillPrefferLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        
        youWillPrefferLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(roundCounterLabel).inset(70)
        }
    }
    
    func layoutFirstOption() {
        view.addSubview(firstOption)
        firstOption.image = UIImage(named: "cardBlue")
        
        firstOption.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(youWillPrefferLabel).inset(40)
        }
    }
    
    func layoutFirstOptionLabel() {
        view.addSubview(firstOptionLabel)
        
        firstOptionLabel.textAlignment = .center
        firstOptionLabel.textColor = .white
        firstOptionLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size:  14)
        firstOptionLabel.numberOfLines = 0
        
        firstOptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(firstOption)
            make.width.equalTo(260)
            make.height.equalTo(30)
        }
    }
    
    func layoutOrLabel() {
        view.addSubview(orLabel)
        orLabel.text = "ИЛИ"
        orLabel.textAlignment = .center
        orLabel.textColor = .white
        orLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        
        orLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstOption).inset(65)
        }
    }
    
    func layoutSecondOption() {
        view.addSubview(secondOption)
        secondOption.image = UIImage(named: "cardPink")
        
        secondOption.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstOption).inset(85)
        }
    }
    
    func layoutSecondOptionLabel() {
        view.addSubview(secondOptionLabel)
        
        secondOptionLabel.textAlignment = .center
        secondOptionLabel.textColor = .white
        secondOptionLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size:  14)
        secondOptionLabel.numberOfLines = 0
        
        secondOptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(secondOption)
            make.width.equalTo(260)
            make.height.equalTo(30)
        }
    }
    
    func layoutLeadingName() {
        view.addSubview(leadingName)
        leadingName.textColor = .white
        leadingName.numberOfLines = 2
        leadingName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 20)
        leadingName.textAlignment = .center
        
        leadingName.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondOption).inset(90)
        }
    }
    
    func layoutLeadingLabel() {
        view.addSubview(leadingLabel)
        leadingLabel.text = "Ведущий"
        leadingLabel.textColor = .white
        leadingLabel.numberOfLines = 2
        leadingLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        leadingLabel.textAlignment = .center
        
        leadingLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(leadingName).inset(20)
        }
    }
    
    func layoutLines() {
        view.addSubview(line1)
        view.addSubview(line2)
        line1.image = UIImage(named: "line")
        line2.image = UIImage(named: "line")
        
        line1.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(1)
            make.top.equalTo(secondOption).inset(110)
            make.left.equalToSuperview().inset(10)
        }
        
        line2.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(1)
            make.top.equalTo(secondOption).inset(110)
            make.right.equalToSuperview().inset(10)
        }
    }
    

    
    func layoutResultsButton() {
        view.addSubview(results)
        view.addSubview(resultsLabel)
        view.addSubview(resultsButton)
        results.image = UIImage(named: "resultsButton")
        
        results.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(45)
            make.bottom.equalTo(-10)
            make.left.equalToSuperview().inset(20)
        }
        
        resultsLabel.text = "Результаты"
        resultsLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        resultsLabel.textColor = .white
        resultsLabel.textAlignment = .center
        
        resultsLabel.snp.makeConstraints { make in
            make.edges.equalTo(results)
        }
        
        resultsButton.snp.makeConstraints { make in
            make.edges.equalTo(results)
        }
    }
    
    func layoutNextStepButton() {
        view.addSubview(nextStep)
        view.addSubview(nextStepLabel)
        view.addSubview(nextStepButton)
        nextStep.image = UIImage(named: "nextStepButton")
        
        nextStep.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(45)
            make.bottom.equalTo(-10)
            make.right.equalToSuperview().inset(20)
        }
        
        nextStepLabel.text = "Передать ход"
        nextStepLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        nextStepLabel.textColor = .white
        nextStepLabel.textAlignment = .center
        
        nextStepLabel.snp.makeConstraints { make in
            make.edges.equalTo(nextStep)
        }
        
        nextStepButton.snp.makeConstraints { make in
            make.edges.equalTo(nextStep)
        }
    }
    
    func layoutPlayerTable() {
        view.addSubview(playerTable)
        
        playerTable.snp.makeConstraints { make in
            make.top.equalTo(leadingLabel.snp.bottom).inset(-30)
            make.bottom.equalTo(resultsButton.snp.top).offset(-20)
            make.left.right.equalToSuperview().inset(10)
        }
    }
    
    
}
