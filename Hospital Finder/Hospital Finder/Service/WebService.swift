//
//  WebService.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation


extension HTTPURLResponse {
    var isSuccess: Bool {
        return (200...299).contains(self.statusCode)
    }
}

enum NetworkErrors: Error {
    case rejected
    public var errorMsg: String? {
        switch self {
        case .rejected:
            return "Unauthorised access....."
        }
    }
}



struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            //status code
            guard let response = response as? HTTPURLResponse, response.isSuccess else {
                completion(nil, NetworkErrors.rejected)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data), error)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            
        }.resume()
        
    }
    
}
