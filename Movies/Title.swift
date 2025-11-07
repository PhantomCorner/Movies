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
    
    
    static var previewTitles = [
        Title(id: 1, title: "Beetle Juice", name: "BeetleJuice", overview: "A movie about BeetleJuice", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Pulp Fiction", name: "Pulp Fiction", overview:"A movie about Pulp Fiction", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "The Dark Knight", name: "The Dark Knight", overview: "A movie about The Dark Knight", posterPath:
            Constants.testTitleURL3),
    ]
}
