//
//  Response.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import Foundation

struct Response: Decodable {
    
   
    var characters: [Character]
    
    
    enum CodingKeys: String, CodingKey {
        
        case characters = "results"
      
    }
}
