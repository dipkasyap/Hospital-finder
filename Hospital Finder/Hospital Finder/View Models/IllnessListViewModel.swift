//
//  IllnessListViewModel.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class IllnessListViewModel {
    
    private var illnessData: IllnessListModel?
    
    func getIlleness() {
        
        guard let url = URL(string: AppConstants.URL.illness) else {
            print("Cannot parse url")
            return
        }
        
        let illnessListResource = Resource<IllnessListModel>(url: url) { data in
            
            let illnessData = try? JSONDecoder().decode(IllnessListModel.self, from: data)
            return illnessData
        }
        
        APIService().load(resource: illnessListResource) { [weak self] result in
            
            
            
            if let weatherVM = result {
                
//                if let delegate = self?.delegate {
//                    delegate.addWeatherDidSave(vm: weatherVM)
//                    self?.dismiss(animated: true, completion: nil)
//                }
                
            }
            
        }
    }
}
