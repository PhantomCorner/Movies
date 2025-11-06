//
//  Title.swift
//  Movies
//
//  Created by Allen Wu on 07/11/2025.
//

import Foundation


struct APIObject:Decodable{
    // if api returns null,
    // set results as empty arrary
    var results: [Title] = []
}


struct Title: Decodable, Identifiable{
    var id: Int?
    // may or maynot have a value
    // if no value, set to nil
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
}
