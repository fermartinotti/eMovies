//
//  UpcomingResponse.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 20/10/2022.
//

import Foundation

// MARK: - UpcomingResponse
struct MoviesResponse: Codable {
    let results: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

