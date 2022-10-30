//
//  VideosResponse.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 30/10/2022.
//

import Foundation

// MARK: VideosResponse
struct VideosResponse: Codable {
    let id: Int
    let results: [Video]
}

// MARK: Video
struct Video: Codable {
    let key: String
    let site: String
}
