//
//  MovieListViewModel.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 8/26/22.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    
    @Published var movies: [MovieViewModel] = []
    
    func search(name: String) async {
        do {
            let movies = try await Webservice().getMovies(searchTerm: name)
            self.movies = movies.map(MovieViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var title: String {
        movie.title
    }
    
    var id: Int {
        movie.id
    }
    
    var voteAverage: Double {
        movie.voteAverage
    }
    
    var releaseDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let date = dateFormatter.date(from: movie.releaseDate)
        return date
    }
    
    var overview: String {
        movie.overview
    }
    
    var posterPath: String? {
        movie.posterPath ?? nil
    }
}
