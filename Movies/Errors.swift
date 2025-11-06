//
//  Errors.swift
//  Movies
//
//  Created by Allen Wu on 07/11/2025.
//

import Foundation


enum APIConfigError: Error,LocalizedError{
    case fileNotFound
    case dataLoadingFailed(underlyingError : Error)
    case decodingFailed(underlyingError : Error)
    
    
    var errorDescription: String?{
        switch self{
        case .fileNotFound:
            return "API config file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data from API config file: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode API config: \(error.localizedDescription)"
        }
   
    }
    
}


enum NetworkError: Error, LocalizedError{
    case badURLResponse(underlyingError:Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String?{
        switch self{
        case .badURLResponse(underlyingError: let error):
            return "Falied to parse URL response: \(error.localizedDescription)"
            
        case .missingConfig:
            return "Missing API config"
        case .urlBuildFailed:
            return "Failed to build URL"
        }
  
    }
}
