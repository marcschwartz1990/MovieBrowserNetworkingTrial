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
    
    var popularity: Double {
        movie.popularity
    }
    
    var releaseDate: String {
        movie.releaseDate
    }
    
    var overview: String {
        movie.overview
    }
    
    var posterPath: URL? {
        URL(string: movie.posterPath)
    }
}
