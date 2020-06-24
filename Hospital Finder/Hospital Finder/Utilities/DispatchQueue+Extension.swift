//
//  DispatchQueue+Extension.swift
//  Hospital Finder
//
//  Created by Admin on 23/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
func delay(_ seconds: Double = 0.1, then: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        then()
    }
}

