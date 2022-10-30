//
//  moviesDAO.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 20/10/2022.
//

import Foundation
import Alamofire

protocol GetMoviesDAODelegate : AnyObject{
    func getMoviesSuccess(movies: MoviesResponse)
    func getMoviesFailure()
}

protocol GetGenresDAODelegate : AnyObject{
    func getGenresSuccess(response: GenresResponse)
    func getGenresFailure()
}

protocol GetVideosDAODelegate: AnyObject{
    func getVideosSuccess(response: VideosResponse)
    func getVideosFailure()
}


class MoviesDao {
    
    weak var getMoviesDelegate: GetMoviesDAODelegate?
    weak var getGenresDelegate: GetGenresDAODelegate?
    weak var getVideosDelegate: GetVideosDAODelegate?
    
    private var apikey : String{
        get {
            guard let value = Bundle.main.infoDictionary?["API_KEY"] as? String else { fatalError("API KEY NOT FOUND") }
            return value
        }
    }
    
    func getUpcomingMovies(){
        AF.request("https://api.themoviedb.org/3/movie/upcoming?api_key=\(apikey)&language=en-US&page=1", method: .get)
            .validate()
            .responseDecodable(of: MoviesResponse.self) { (response) in
                switch response.result{
                case .success(let movies):
                    self.getMoviesDelegate?.getMoviesSuccess(movies: movies)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    print(error)
                    self.getMoviesDelegate?.getMoviesFailure()
                }
            }
    }
    
    func getTopRatedMovies(){
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=\(apikey)&language=en-US&page=1", method: .get)
            .validate()
            .responseDecodable(of: MoviesResponse.self) { (response) in
                switch response.result{
                case .success(let movies):
                    self.getMoviesDelegate?.getMoviesSuccess(movies: movies)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    print(error)
                    self.getMoviesDelegate?.getMoviesFailure()
                }
            }
    }
    
    func getGenres(){
        AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=\(apikey)&language=en-US", method: .get)
            .validate()
            .responseDecodable(of: GenresResponse.self) { (response) in
                switch response.result{
                case .success(let genres):
                    self.getGenresDelegate?.getGenresSuccess(response: genres)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    self.getGenresDelegate?.getGenresFailure()
                }
            }
    }
    
    func getVideos(movieId: String){
        AF.request("https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(apikey)&language=en-US", method: .get)
            .validate()
            .responseDecodable(of: VideosResponse.self) { (response) in
                switch response.result{
                case .success(let videos):
                    self.getVideosDelegate?.getVideosSuccess(response: videos)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    self.getVideosDelegate?.getVideosFailure()
                }
            }
    }
    
}
