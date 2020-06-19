//
//  IllnessListViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
import NotificationBannerSwift

class IllnessListViewModel {
    
    private var illnessData: IllnessListModel?
    private(set) var illnesses = [IllnessViewModel]()

    
    var numbersOfIllness: Int  {
        return self.illnesses.count
    }
    
    func illness(forIndex index: Int)-> IllnessViewModel  {
          return self.illnesses[index]
      }
    
        
    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (success: Bool, error: Error)->())
     */
    func getIlleness(_ then: @escaping (_:Bool, _:Error?)->()) {
        
        guard let url = URL(string: AppConstants.URL.illness) else {
            print("Cannot parse url")
            return
        }
        
        let illnessListResource = Resource<IllnessListModel>(url: url) { data in
            
            let illnessData = try? JSONDecoder().decode(IllnessListModel.self, from: data)
            return illnessData
        }
        
        APIService().load(resource: illnessListResource) { [weak self] result, error in
            
            if let illnessData = result {
                
                self?.illnessData = illnessData
                if let illnessModel = illnessData.illnesses {
                    self?.illnesses = illnessModel.map{IllnessViewModel($0)}
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
}

