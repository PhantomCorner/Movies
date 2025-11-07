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
    
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        do{
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        }catch{
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
