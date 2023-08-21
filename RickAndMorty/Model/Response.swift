//
//  Response.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

struct Response<T: Decodable>: Decodable {
    let results: [T]
}

