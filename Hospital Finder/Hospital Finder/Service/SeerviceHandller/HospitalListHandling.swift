//
//  IllnessListHandling
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//
import Foundation

protocol HospitalListHandling {
    func getHospitals(_ then: @escaping (_: HospitalListModel?, _: Error?) -> Void)
}

final class HospitalListHandler: HospitalListHandling {
   
    private let webService: WebService
    
    init(withWebService webService: WebService = WebService()) {
        self.webService = webService
    }
    
    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (data: HospitalListModel?, error: Error?)->())
     */
    func getHospitals(_ then: @escaping (_: HospitalListModel?, _: Error?) -> Void) {
        guard let url = URL(string: AppConstants.URL.hospitals) else { return }
        
        let hospitalListResource = Resource<HospitalListModel>(url: url) { data in
            let hospitalData = try? JSONDecoder().decode(HospitalListModel.self, from: data)
            return hospitalData
        }
        
        webService.load(resource: hospitalListResource) {result, error in
            
            if let illnessData = result {
                then(illnessData, nil)
            } else {
                // error
                then(nil, error)
            }
        }
    }
    
}
