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
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    let posterPath: String?
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
        case id = "id"
    }
    
    // SHOULD THIS FUNCTION GO HERE?
    
//    func convertDateTo(numeric date: String) -> String {
//        /// Converts date from YYYY-MM-DD format to MM/DD/YY format
//        let dateToConvert = date
//        let dateToConvertArray = dateToConvert.components(separatedBy: "-")
//
//        let twoDigitYear: Substring = dateToConvertArray[0].dropFirst(2)
//        let month: String = dateToConvertArray[1]
//        let day: String = dateToConvertArray[2]
//
//        return "\(month)/\(day)/\(twoDigitYear)"
//    }
}
