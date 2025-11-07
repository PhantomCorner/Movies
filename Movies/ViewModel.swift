//
//  ViewModel.swift
//  Movies
//
//  Created by Allen Wu on 07/11/2025.
//

import Foundation

@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError:Error)
    }
    // only viewmodel can access the status of response
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingTV: [Title] = []
    var trendingMovies: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV : [Title] = []
    func getTitles() async {
        homeStatus = .fetching
        
        if trendingMovies.isEmpty{
            
            do{
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tTVs = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRTV =  dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                topRatedMovies = try await tMovies
                trendingMovies = try await tRMovies
                
                topRatedTV = try await tTVs
                trendingTV = try await tRTV
                
                homeStatus = .success
            }catch{
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        }else{
            homeStatus = .success
        }
    }
}
