//
//  DBService.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 19/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

enum DBActionResult {
    case success
    case failure
}

protocol DBSaveable {
    func savePatient(_ patient: PatientDBModel,  _ then: (_: DBActionResult)->()) 
}

class DBService: DBSaveable {
    
     let realm = try! Realm()
        
    /// Saves patient info to Realm DB on mobile
    /// - Parameters:
    ///   - patient: Patient_DB_Model
    ///   - then: call back  (_: DBActionResult)->()
     func savePatient(_ patient: PatientDBModel,  _ then: (_: DBActionResult)->()) {
                
        if realm.isInWriteTransaction {
            do {
                try realm.commitWrite()
            } catch {
                print("Unable to commit")
            }
        }
        
        do {
            try realm.write {
                realm.add(patient, update: .modified)
            }
        }
        catch  {
            then(.failure)
            print("could not write")
        }
        
        then(.success)
        
    }
}


