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
    private let illnessListHandler: IllnessListHandling
    
    var numbersOfIllness: Int { self.illnesses.count }
    
    init(withIllnessListHandling illnessListHandler: IllnessListHandling = IllnessListHandler()) {
        self.illnessListHandler = illnessListHandler
    }
    
    func illness(forIndex index: Int) -> IllnessViewModel {
        return self.illnesses[index]
    }
    
    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (success: Bool, error: Error)->())
     */
    func getIlleness(_ then: @escaping (_:Bool, _:Error?) -> Void) {
        illnessListHandler.getIllnesses { [weak self] (illnessListModel, error) in
            
            if let illnessListModel = illnessListModel {
                
                self?.illnessData = illnessListModel
                if let illnessModel = illnessListModel.illnesses {
                    self?.illnesses = illnessModel.map {IllnessViewModel($0)}
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
