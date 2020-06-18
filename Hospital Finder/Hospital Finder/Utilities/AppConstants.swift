//
//  AppConstants.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

struct AppConstants {
    
    //MARK:-App Colors
    struct Color {
        
        static var hospitalBlue: UIColor {
            return #colorLiteral(red: 0.1764705882, green: 0.7098039216, blue: 0.9725490196, alpha: 1)
        }
    }
}


//MARK:- API End Points
extension AppConstants {
    
    /********* App service urls *********/
    struct URL {
        
        private  static let baseURL = "http://dmmw-api.australiaeast.cloudapp.azure.com:8080"

        //{"href":"http://dmmw-api.australiaeast.cloudapp.azure.com:8080/hospitals?limit=10&page=1"}}
        //pagination
        
        static var hospitals: String {
            return baseURL + "/hospitals"
        }
        
        static var illness: String {
            return baseURL + "/illnesses"
        }
        
    }
}
