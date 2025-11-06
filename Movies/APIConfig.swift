//
//  APIConfig.swift
//  Movies
//
//  Created by Allen Wu on 07/11/2025.
//

import Foundation

struct APIConfig:Decodable{
    let tmdbBaseURL:String
    let APIkey: String
    
    // load the content form apiconfig.json
    static let shared: APIConfig? = {
        do{
            return try loadConfig()
        }catch{
            print("Falied to load API config: \(error.localizedDescription)")
            return nil
        }
        
    }()
    
    
    private static func loadConfig() throws -> APIConfig{
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json")else{
            throw APIConfigError.fileNotFound
        }
        // if loaded
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }catch let error as DecodingError{
            // else error
            throw APIConfigError.decodingFailed(underlyingError: error)
            
        }catch{
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
