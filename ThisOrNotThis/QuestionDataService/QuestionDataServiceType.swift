//
//  QuestionDataServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 02.05.2022
//	
//

import Foundation

protocol QuestionDataServiceType: JsonDataService {
    //func getFree(setName: String) -> [Question]
    func getAll(setName: String) -> [Question]
    func save(question: Question)
    func importToRealm()
    //func resetCard()
}
