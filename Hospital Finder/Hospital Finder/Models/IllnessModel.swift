//
//  IllnessModel.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct IllnessListModel : Decodable {
    
    let illnesses : [Illnesses]?
    let page : Page?
    
    enum CodingKeys: String, CodingKey {
        case _embedded = "_embedded"
        case illnesses = "illnesses"
        case page = "page"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        let embeddedContainer =  try container.nestedContainer(keyedBy: CodingKeys.self, forKey: ._embedded)
             
        //illnesses = try embeddedContainer.decodeIfPresent([Illnesses].self, forKey: .illnesses)
        
        illnesses = try embeddedContainer.decodeIfPresent([Illnesses].self, forKey: .illnesses)

        
        page = try container.decodeIfPresent(Page.self, forKey: .page)
    }
    
}

struct Illnesses: Codable {
    let illness : Illness?
    enum CodingKeys: String, CodingKey {
        case illness = "illness"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        illness = try values.decodeIfPresent(Illness.self, forKey: .illness)
    }
}

struct Illness : Codable {
    let name : String?
    let id : Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
}

struct Page : Codable {
    let size : Int?
    let totalElements : Int?
    let totalPages : Int?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case size = "size"
        case totalElements = "totalElements"
        case totalPages = "totalPages"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        totalElements = try values.decodeIfPresent(Int.self, forKey: .totalElements)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
    }
    
}
