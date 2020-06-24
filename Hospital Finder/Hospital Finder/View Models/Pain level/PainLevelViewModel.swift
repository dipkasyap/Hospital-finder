//
//  PainLevelViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

class PainLevelViewModel {
    var painLevel: PainLevel?
    var subtitleInfo: String {
          return  "Pain level: \(painLevel?.description ?? "na")"
      }
}
