//
//  moviesDAO.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 20/10/2022.
//

import Foundation
import Alamofire

protocol GetUpcomingMoviesDAODelegate : AnyObject{
    func getUpcomingMoviesSuccess(movies: MoviesResponse)
    func getUpcomingMoviesFailre()
}

protocol GetTopRatedMoviesDAODelegate : AnyObject{
    func getTopRatedMoviesSuccess(movies: MoviesResponse)
    func getTopRatedMoviesFailre()
}



class MoviesDao {
    
    weak var getUpcomingMoviesDelegate: GetUpcomingMoviesDAODelegate?
    
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
                    self.getUpcomingMoviesDelegate?.getUpcomingMoviesSuccess(movies: movies)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    print(error)
                    self.getUpcomingMoviesDelegate?.getUpcomingMoviesFailre()
                }
            }
    }
    
    func getTopRatedMovies(){
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=\(apikey)&language=en-US&page=1", method: .get)
            .validate()
            .responseDecodable(of: MoviesResponse.self) { (response) in
                switch response.result{
                case .success(let movies):
                    self.getUpcomingMoviesDelegate?.getUpcomingMoviesSuccess(movies: movies)
                    // TODO: FALTA GUARDAR EN COREDATA
                case .failure(let error):
                    print(error)
                    self.getUpcomingMoviesDelegate?.getUpcomingMoviesFailre()
                }
            }
    }
    
}
