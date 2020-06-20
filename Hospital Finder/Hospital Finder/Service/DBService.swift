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

class DBService {
    
    static let realm = try! Realm()
    
    private init() { }
    
    /// Saves patient info to Realm DB on mobile
    /// - Parameters:
    ///   - patient: Patient_DB_Model
    ///   - then: call back  (_: DBActionResult)->()
    class func savePatient(
        withIllness illness: IllnessViewModel,
        andPainLevel painLevel: PainLevel,
        forHospital hospital: HospitalViewModel
        , _ then: (_: DBActionResult)->()) {
        
        let hospitalDBObject = HospitalDBModel(id: hospital.id!, name: hospital.name ?? "na")
        let illnessDBObject = IllnessDBModel(id: illness.id!, name: illness.name ?? "na")
        
        let patientInfo = PatientDBModel(
            painLevel: painLevel.rawValue,
            hospital: hospitalDBObject,
            illness: illnessDBObject)
        
        if realm.isInWriteTransaction {
            do {
                try realm.commitWrite()
            } catch {
                print("Unable to commit")
            }
        }
        
        do {
            try realm.write {
                realm.add(patientInfo, update: .modified)
            }
        }
        catch  {
            then(.failure)
            print("could not write")
        }
        
        then(.success)
        
    }
}


