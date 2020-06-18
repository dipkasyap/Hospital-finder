//
//  HospitalListViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//


import Foundation

class HospitalListViewModel {
    
    private var hospitalData: HospitalListModel?
    private(set) var hospitals = [HospitalViewModel]()

    //get patient Pain level and filter Hospitals
    
    var numbersOfHospitals: Int  {
        //apply filter
        return self.hospitals.count
    }
    
    func hospitals(forIndex index: Int)-> HospitalViewModel  {
            //apply filter
          return self.hospitals[index]
      }
    
        
    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (success: Bool, error: Error)->())
     */
    func getHospitals(_ then: @escaping (_:Bool, _:Error?)->()) {
        
        guard let url = URL(string: AppConstants.URL.hospitals) else {
            print("Cannot parse url")
            return
        }
        
        let hospitalListResource = Resource<HospitalListModel>(url: url) { data in
            
            let hospitalData = try? JSONDecoder().decode(HospitalListModel.self, from: data)
            return hospitalData
        }
        
        APIService().load(resource: hospitalListResource) { [weak self] result, error in
            
            
            if let hospitalData = result {
                
                self?.hospitalData = hospitalData
              
                if let hospitalModel = hospitalData.hospitals {
                    self?.hospitals = hospitalModel.map{HospitalViewModel($0)}
                }
                then(true, nil)
                                
            } else {
                //error
                then(false, error)
            }
            
        }
    }
}

