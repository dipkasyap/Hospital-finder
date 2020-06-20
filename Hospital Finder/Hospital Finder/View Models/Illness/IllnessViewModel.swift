//
//  IllnessViewModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

struct IllnessViewModel: Equatable {
    let name: String?
    let id: Int?
    
    init(_ illness: Illnesses) {
        name = illness.illness?.name
        id = illness.illness?.id
    }
}
