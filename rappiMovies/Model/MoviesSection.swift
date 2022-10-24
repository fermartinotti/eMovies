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
}

struct MoviesSection{
    var type: SectionType
}
