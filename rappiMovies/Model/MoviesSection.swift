//
//  MoviesSection.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 22/10/2022.
//

import Foundation

enum SectionType {
    case upcoming
    case trending
    case recommended
}

struct MoviesSection{
    var type: SectionType
}
