//
//  DataServise.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import Foundation

class DataService {
    
    func loadCharacters(completion: @escaping ([Character]) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character")
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Response.self, from: data).characters
                completion(result)
            } catch {
                print(error)
            }
        }.resume()
    }
}
