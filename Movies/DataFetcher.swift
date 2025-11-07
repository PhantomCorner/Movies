//
//  DataFetcher.swift
//  Movies
//
//  Created by Allen Wu on 07/11/2025.
//

import Foundation

struct DataFetcher{
    
    let BaseURL = APIConfig.shared?.tmdbBaseURL
    let APIKey = APIConfig.shared?.APIkey
    
    // fetch title for media
    // return an array
    func fetchTitles(for media:String) async throws -> [Title]{
        // make sure the base url and api key are not nil
        // since these two are using the value shared from APIConfig
        guard let baseURL = BaseURL else{
            throw NetworkError.missingConfig
        }
        guard let apiKey = APIKey else{
            throw NetworkError.missingConfig
        }
        
        guard let fetchTitlesURL = URL(string: baseURL)?
            .appending(path: "3/trending/\(media)/day")
            .appending(queryItems:[
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else{
            throw NetworkError.urlBuildFailed
        }
        print(fetchTitlesURL)
        
        // returns data & url response
        // urlsession -> handles network request
        let(data,URLResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = URLResponse as? HTTPURLResponse,response.statusCode==200 else{
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (URLResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey:"Invalid HTTP Response"]
            ))
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        return titles
    }
    
}
