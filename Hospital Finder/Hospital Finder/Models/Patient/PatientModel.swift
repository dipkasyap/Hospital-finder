//
//  PatientModel.swift
//  Hospital Finder
//
//  Created by Admin on 19/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


class Patient_DB_Model: Object {
    //TODO:- id is static for now, need to provide dynamic id based on user info
    @objc dynamic var id = 0
    @objc dynamic var painLevel = 0
    @objc dynamic var hospital: Hospital_DB_Model?
    @objc dynamic var illness: Illness_DB_Model?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(painLevel: Int, hospital: Hospital_DB_Model, illness: Illness_DB_Model) {
        self.init()
        self.painLevel = painLevel
        self.hospital = hospital
        self.illness = illness
    }
    
}

class Hospital_DB_Model: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
}

class Illness_DB_Model: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
}

