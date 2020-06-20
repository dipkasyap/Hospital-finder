//
//  HospitalViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

class HospitalViewModel {

    private var hospital: Hospital!
    
    var name: String? { hospital.name }
    
    var id: Int? { return hospital.id }
    
    var location : (lat: Double?, long:Double?)? { (hospital.location?.lat, hospital.location?.lng) }
    
    private(set) var waitingTime: Int = 0
    
    init(_ hospital: Hospital) {
        self.hospital = hospital
    }
    
    func calculate(waitingTimeForPainLevel painLevel: PainLevel ) {
        if let waitingList =  hospital.waitingList?.filter({$0.levelOfPain == painLevel.rawValue}).first {
            waitingTime = (waitingList.patientCount ?? 0) * (waitingList.averageProcessTime ?? 0)
            
        }
    }
}
