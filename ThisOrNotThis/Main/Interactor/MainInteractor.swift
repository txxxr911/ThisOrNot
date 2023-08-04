//
//  MainInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation
import UIKit

class MainInteractor: MainInteractorInput {
    var cards: [UIView] = []
    
    let questionDataService: QuestionDataServiceType
    
    
    init(questionDataService: QuestionDataServiceType) {
        self.questionDataService = questionDataService
    }
    func showCards() {
        
    }
    
    func prepareQuestions() {
        if let questionVersion = UserDefaults.standard.object(forKey: "questionVersion") as? Int, questionVersion == Constants.Versions.questionVersion { print("questions prepared")
            return }
        print("now I'll prepare questions")
        questionDataService.importToRealm()
        UserDefaults.standard.set(Constants.Versions.questionVersion, forKey: "questionVersion")
    }
}

// MARK: - Private
extension MainInteractor {

}
