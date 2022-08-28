//
//  Movie.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 8/26/22.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let popularity: Double
    let releaseDate: String
    let overview: String
    let posterPath: String
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
        case id = "id"
    }
}
