//
//  Task.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import RealmSwift

class QuestionRealm: Object {
    override init() {
        super.init()
    }
    
    init(question: Question) {
        super.init()
        
        id = question.id
        setName = question.setName
        isPlayed = question.isPlayed
        rufirst = question.rufirst
        rusecond = question.rusecond
        enfirst = question.enfirst
        ensecond = question.ensecond
    }
    
    @objc dynamic var id = 0
    @objc dynamic var setName = ""
    @objc dynamic var isPlayed = 0
    @objc dynamic var rufirst: String = ""
    @objc dynamic var rusecond: String = ""
    @objc dynamic var enfirst: String = ""
    @objc dynamic var ensecond: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Question: Codable, Equatable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        lhs.id == rhs.id
    }
    init() {
        
    }
    init(realmObject: QuestionRealm) {
        id = realmObject.id
        setName = realmObject.setName
        rufirst = realmObject.rufirst
        rusecond = realmObject.rusecond
        enfirst = realmObject.enfirst
        ensecond = realmObject.ensecond
    }
    
    var id: Int = 0
    var setName: String = ""
    var isPlayed: Int = 0
    var rufirst: String = ""
    var rusecond: String = ""
    var enfirst: String = ""
    var ensecond: String = ""
}

class QuestionModel {
    let question: Question
    
    init(question: Question) {
        self.question = question
    }
}
