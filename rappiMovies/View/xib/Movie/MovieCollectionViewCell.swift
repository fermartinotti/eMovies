//
//  MovieCollectionViewCell.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 23/10/2022.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.posterImageView.layer.cornerRadius = 7
        self.posterImageView.clipsToBounds = true
        // Initialization code
    }
    
    func configureCell(movie: Movie){
        if let posterPath = movie.posterPath{
            let stringURL = "https://image.tmdb.org/t/p/original\(posterPath)"
            let posterURL = URL(string: stringURL)
            posterImageView.kf.setImage(with: posterURL)
        }
        // TODO: Ver que hago cuando no tengo posterPath.
    }

}
