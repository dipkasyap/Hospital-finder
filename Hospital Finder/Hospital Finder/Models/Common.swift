//
//  Common.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

/// Defines pain level 0 to 4
enum PainLevel: Int, Codable {
    case least = 0
    case mild = 1
    case moderate = 2
    case high = 3
    case dangerous = 4
    
    var description: String {
        switch self {
        case .least:
            return "low"
        case .mild:
            return "mild"
        case .moderate:
            return "moderate"
        case .high:
            return "high"
        case .dangerous:
            return "dangerous"
            
        }
    }
}
