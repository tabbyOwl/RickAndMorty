//
//  Episode.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

struct Episode: Decodable {
    let id : Int
    let name: String
    let date: String
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date = "air_date"
        case episode
    }
}

