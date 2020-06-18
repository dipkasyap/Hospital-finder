//
//  APIService.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class APIService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
        
            if let data = data {
                DispatchQueue.main.async {
                     completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
