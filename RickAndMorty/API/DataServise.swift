//
//  DataServise.swift
//  RickAndMorty
//
//  Created by Svetlana Oleinikova on 19.08.2023.
//

import Foundation

final class DataService {
    
    static let urlsForAllEpisodes = ["https://rickandmortyapi.com/api/episode", "https://rickandmortyapi.com/api/episode?page=2", "https://rickandmortyapi.com/api/episode?page=3"]
    
     func loadCharacters(completion: @escaping ([Character]) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character")
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
               let result = try JSONDecoder().decode(Response<Character>.self, from: data).results
                    completion(result)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func loadEpisodes(url: String, completion: @escaping ([Episode]) -> ()) {
      
        guard let url = URL(string: url)
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Response<Episode>.self, from: data).results
                completion(result)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func loadOrigin(url: String, completion: @escaping (Origin) -> ()) {
        guard let url = URL(string: url)
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Origin.self, from: data)
                completion(result)
            } catch {
                print(error)
            }
        }.resume()
    }
}
