//
//  Int+Extension.swift
//  Hospital Finder
//
//  Created by Admin on 19/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

extension Int {
    /// Converts given minutes to hours, days.... if applicable
    var toReadableTime: String {
        if self < 60 {
            return "\(self) mins"
        } else if self < (60 * 24) {
            return "\(self / (60)) hrs"
        } else {
            let days = (self / (60 * 24))
            let unit = (days > 1) ? "days" : "day"
            return "\(days) \(unit)"
        }
    }
}
