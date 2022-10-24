//
//  MovieDetailViewController.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 23/10/2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movie: Movie?
    var poster: UIImage?
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        
    }
    
    private func configureView(){
        configureBackgroundGradient()
        if let poster = poster{
            posterImageView.image = poster
        }
        
        if let movie = movie{
            if let title = movie.title{
                //titleLabel.text = title
            }
        }
    }
    
    private func configureBackgroundGradient(){
        // background-gradient-down
        let downGradient = CAGradientLayer()
        downGradient.colors = [
          UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
          UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]
        downGradient.locations = [0, 1]
        downGradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        downGradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        downGradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: -0.82, c: 0.82, d: 0, tx: 0.09, ty: 0.98))
        downGradient.frame = posterImageView.bounds
        downGradient.position = posterImageView.center
        posterImageView.layer.addSublayer(downGradient)

        // background-gradient-up
        let upGradient = CAGradientLayer()
        upGradient.colors = [
          UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
          UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]
        upGradient.locations = [0.02, 1]
        upGradient.startPoint = CGPoint(x: 0.5, y: 0)
        upGradient.endPoint = CGPoint(x: 0.5, y: 1)
        upGradient.frame = CGRect(x: 0, y: 0, width: posterImageView.bounds.width, height: posterImageView.bounds.height)
        upGradient.position = posterImageView.center
        posterImageView.layer.insertSublayer(upGradient, at: 0)
    }

}
