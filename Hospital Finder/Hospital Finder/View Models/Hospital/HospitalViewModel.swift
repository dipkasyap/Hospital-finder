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
    
    var name: String? {
        return hospital.name
    }
    
    var id: String? {
         return hospital.name
     }
    
    var location : (lat: Double?, long:Double?)? {
        return (hospital.location?.lat, hospital.location?.lng)
    }
    
    init(_ hospital: Hospital) {
        self.hospital = hospital
    }
}
