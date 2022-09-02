//
//  ContentView.swift
//  MovieBrowserNetworkingTrial
//
//  Created by Marc-Developer on 8/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(movieListVM.movies, id: \.id) { movie in
                NavigationLink {
                    infoPageView(movie: movie)
                } label: {
                    searchResultView(movie: movie)
                }
                .navigationBarTitle("Movie Search", displayMode: .inline)
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    async {
                        if !value.isEmpty && value.count > 3 {
                            await movieListVM.search(name: value)
                        }
                    }
                }
            
                .navigationTitle("Movie Search")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct searchResultView: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(movie.title)
                    .font(.system(size: 20))
                    
                Text(movie.releaseDate?.monthDayYearString ?? "Release date non-existent")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack (alignment: .trailing) {
                Text(String(format: "%.1f", movie.voteAverage))
                    .font(.system(size: 12))
            }
        }
    }
}

struct infoPageView: View {
    let movie: MovieViewModel
    
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.system(size: 36))
            Text("Release Date: \(movie.releaseDate?.monthDayYearString ?? "Release date non-existent")")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(20)
            
            HStack {
                AsyncImage(url: movie.posterPath!) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 200)
                
                Text(movie.overview)
            }
            .padding(20)
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
