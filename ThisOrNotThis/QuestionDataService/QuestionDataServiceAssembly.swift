//
//  QuestionDataServiceAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 02.05.2022
//	
//

import Foundation

class QuestionDataServiceAssembly: Assembly {
    func build() -> QuestionDataServiceType {
        let service = QuestionDataService()
        return service
    }
}
