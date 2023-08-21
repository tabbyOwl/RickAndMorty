//
//  Character.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let status: String
    let gender: String
    let species: String
    let type: String
    let episode: [String]
    let origin: OriginUrl
}

struct OriginUrl: Decodable {
    let name: String
    let url: String
}

struct Origin: Decodable {
    let name: String
    let type: String
}
