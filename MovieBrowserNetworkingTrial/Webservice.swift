//
//  Webservice.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 8/26/22.
//

import Foundation
import SwiftUI


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

        return movieResponse?.results ?? []
    }
    
    
    
    func getImage(imagePath: String) async throws -> Image? {
        var components = URLComponents()
    //    https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
            components.scheme = "https"
            components.host = "image.tmdb.org"
            components.path = "/t/p/original" + "\(imagePath)"
          
        guard let url = components.url else {
            print("Invalid URL")
            throw NetworkError.badURL
        }

        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }

        // TODO: Get data from shared URLSession. Initialize UIImage from data.
        // Initialize Image from UIImage and return optional Image
        
        
    }
}
