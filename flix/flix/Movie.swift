//
//  Movie.swift
//  flix
//
//  Created by Ellis Crawford on 10/7/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import Foundation


import Foundation

enum MovieKeys {
    static let TITLE = "title"
    static let RELEASE_DATE = "release_date"
    static let OVERVIEW = "overview"
    static let BASE_URL = "https://api.themoviedb.org/3/movie/"
    static let IMG_BASE_URL = "https://image.tmdb.org/t/p/w500"
    static let VIDEO_BASE_URL_2 = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
    static let BACKDROP_PATH = "backdrop_path"
    static let POSTER_PATH = "poster_path"
    static let ID = "id"
}

class Movie {
    var id: NSNumber
    var title: String
    var releaseDate: String
    var overview: String
    var posterURL: URL?
    var backdropURL: URL?
    var trailerURL: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary[MovieKeys.TITLE] as? String ?? "No title"
        releaseDate = dictionary[MovieKeys.RELEASE_DATE] as? String ?? "No date"
        overview = dictionary[MovieKeys.OVERVIEW] as? String ?? "No overview"
        let backdropPathString = dictionary[MovieKeys.BACKDROP_PATH] as! String
        backdropURL = URL(string: MovieKeys.IMG_BASE_URL + backdropPathString)
        let posterPathString = dictionary[MovieKeys.POSTER_PATH] as! String
        posterURL = URL(string: MovieKeys.IMG_BASE_URL + posterPathString)
        id = dictionary[MovieKeys.ID] as! NSNumber
        trailerURL = URL(string: MovieKeys.BASE_URL + id.stringValue + MovieKeys.VIDEO_BASE_URL_2)
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
}
