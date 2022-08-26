//
//  Webservice.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 8/26/22.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case badID
}

class Webservice {
    
    func getMovies(searchTerm: String) async throws -> [Movie] {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/search/movie"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "f1bba69d2f7b8e57f3db0f3c5cf16c9a"),
            URLQueryItem(name: "query", value: searchTerm)
        ]
        
        guard let url = components.url else {
            print("Invalid URL")
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }

        let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse?.movies ?? []
    }
}
