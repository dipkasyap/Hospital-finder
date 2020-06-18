//
//  AppConstants.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit

struct AppConstants {
    
    //MARK:-App Colors
    struct Color {
        
        static var hospitalBlue: UIColor {
            return #colorLiteral(red: 0.1764705882, green: 0.7098039216, blue: 0.9725490196, alpha: 1)
        }
        
        static var titleGray: UIColor {
            return #colorLiteral(red: 0.2468972802, green: 0.2508656383, blue: 0.2591493726, alpha: 1)
        }
        
        static var subtitleGray: UIColor {
            return #colorLiteral(red: 0.345056951, green: 0.3451216519, blue: 0.3450528681, alpha: 1)
        }
        
        static var subtitleGrayLight: UIColor {
            return #colorLiteral(red: 0.6469867826, green: 0.647100389, blue: 0.64697963, alpha: 1)
        }
        
        static var background: UIColor {
            return #colorLiteral(red: 0.9605260491, green: 0.9644870162, blue: 0.9809592366, alpha: 1)
        }
        
        static var discloseButton: UIColor {
            return #colorLiteral(red: 0.7163607478, green: 0.3237760365, blue: 0.4537965059, alpha: 1)
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
