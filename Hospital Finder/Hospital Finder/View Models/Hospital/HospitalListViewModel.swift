//
//  HospitalListViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//


import Foundation
import NotificationBannerSwift

class HospitalListViewModel {
    
    private var hospitalData: HospitalListModel?
    private(set) var hospitals = [HospitalViewModel]()
    private let hospitalListHandler: HospitalListHandling

    var numbersOfHospitals: Int  { self.hospitals.count }
    
    init(withHospitalistHandling hospitalListHandler: HospitalListHandling = HospitalListHandler()) {
        self.hospitalListHandler = hospitalListHandler
    }

    func hospitals(forIndex index: Int)-> HospitalViewModel  {
        return self.hospitals[index]
    }

    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (success: Bool, error: Error)->())
     */
    func getHospitals(_ then: @escaping (_:Bool, _:Error?)->()) {
        
        hospitalListHandler.getHospitals { [weak self] (hospitalListModel, error) in
            if let hospitalData = hospitalListModel {
                
                self?.hospitalData = hospitalData
                
                if let hospitalModel = hospitalData.hospitals {
                    self?.hospitals = hospitalModel.map{HospitalViewModel($0)}
                }
                then(true, nil)
                
            } else {
                //error
                let banner = FloatingNotificationBanner(subtitle: error?.localizedDescription, style: .danger)
                banner.show()
                then(false, error)
            }
        }
    }
    
    
    /// Sorts the hospitals with calculating waiting time for pain level provided
    /// - Parameter painLevel: PainLevel
    func applyPainLevel(_ painLevel: PainLevel) {
        hospitals.forEach { (aHospital) in
            aHospital.calculate(waitingTimeForPainLevel: painLevel)
        }
        hospitals.sort{$0.waitingTime < $1.waitingTime}
    }
    
}

