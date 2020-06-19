//
//  IllnessListHandling
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//
import Foundation

protocol IllnessListHandling {
    func getIllnesses(_ completion: @escaping (_: IllnessListModel?, _: Error?) -> Void)
}

final class IllnessListHandler: IllnessListHandling {
    
    private let webService: WebService
    
    init(withWebService webService: WebService = WebService()) {
        self.webService = webService
    }
    
    /**
     Calls Illness getter API
     - returns: (success, error?)
     - Parameter then: (data: IllnessListModel?, error: Error?)->())
     */
    func getIllnesses(_ completion: @escaping (_: IllnessListModel?, _: Error?) -> Void) {
        guard let url = URL(string: AppConstants.URL.illness) else { return }
        
        let illnessListResource = Resource<IllnessListModel>(url: url) { data in
            
            let illnessData = try? JSONDecoder().decode(IllnessListModel.self, from: data)
            return illnessData
        }
        
        webService.load(resource: illnessListResource) {result, error in
            
            if let illnessData = result {
                completion(illnessData, nil)
            } else {
                // error
                completion(nil, error)
            }
        }
    }
    
}
