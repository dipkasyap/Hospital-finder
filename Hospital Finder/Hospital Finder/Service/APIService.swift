//
//  APIService.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class APIService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
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
