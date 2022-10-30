//
//  GenresResponse.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 29/10/2022.
//

import Foundation

// MARK: - GenresResponse
struct GenresResponse: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

