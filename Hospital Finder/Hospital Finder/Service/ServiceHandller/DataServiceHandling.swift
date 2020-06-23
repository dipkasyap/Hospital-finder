//
//  DataServiceHaldller.swift
//  Hospital Finder
//
//  Created by Admin on 23/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

protocol DataServiceHandling {
    func save(
        _ illness: IllnessViewModel,
        withPainLevel painLevel: PainLevel,
        forHospital hospital: HospitalViewModel,
        _ then: @escaping (_: Bool) -> Void)
}

final class DataServiceHandler: DataServiceHandling {
   
    private let dbService: DBSaveable
    
    init(_ dbService: DBSaveable = DBService()) {
        self.dbService = dbService
    }
    
    func save(
        _ illness: IllnessViewModel,
        withPainLevel painLevel: PainLevel,
        forHospital hospital: HospitalViewModel,
        _ then: @escaping (_: Bool) -> Void) {
        
        let hospitalDBObject = HospitalDBModel(id: hospital.id!, name: hospital.name ?? "na")
        let illnessDBObject = IllnessDBModel(id: illness.id!, name: illness.name ?? "na")
        
        let patientInfo = PatientDBModel(
            painLevel: painLevel.rawValue,
            hospital: hospitalDBObject,
            illness: illnessDBObject)
        
        dbService.savePatient(patientInfo) { (result) in
            then(result == .success ? true : false)
        }
        
    }
    
    
}
