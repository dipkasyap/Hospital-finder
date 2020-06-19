//
//  HospitalListModel.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation

struct HospitalListModel : Decodable {
    
    let hospitals : [Hospital]?
    let page : Page?
    
    enum CodingKeys: String, CodingKey {
        case _embedded = "_embedded"
        case hospitals = "hospitals"
        case page = "page"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let embeddedContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: ._embedded)
        hospitals = try embeddedContainer.decodeIfPresent([Hospital].self, forKey: .hospitals)
        page = try container.decodeIfPresent(Page.self, forKey: .page)
    }
    
}

struct Hospital : Codable {
    let id : Int?
    let name : String?
    let waitingList : [WaitingList]?
    let location : Location?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case waitingList = "waitingList"
        case location = "location"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        waitingList = try values.decodeIfPresent([WaitingList].self, forKey: .waitingList)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
    }
    
}

struct WaitingList : Codable {
    let patientCount : Int?
    let levelOfPain : Int?
    let averageProcessTime : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case patientCount = "patientCount"
        case levelOfPain = "levelOfPain"
        case averageProcessTime = "averageProcessTime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        patientCount = try values.decodeIfPresent(Int.self, forKey: .patientCount)
        levelOfPain = try values.decodeIfPresent(Int.self, forKey: .levelOfPain)
        averageProcessTime = try values.decodeIfPresent(Int.self, forKey: .averageProcessTime)
    }
    
}

struct Location : Codable {
    let lat : Double?
    let lng : Double?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }
    
}
