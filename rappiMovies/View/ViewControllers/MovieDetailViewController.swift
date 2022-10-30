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
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addCustomBack()

    }
    
    private func configureView(){
        configureBackgroundGradient()
        if let poster = poster{
            posterImageView.image = poster
        }
        
        if let movie = movie{
            //Set title
            if let title = movie.title{
                titleLabel.text = title
            }
            
            // Set movie date
            if let movieDate = movie.releaseDate{
                let stringDate = String(movieDate.prefix(4))
                yearButton.setTitle(stringDate, for: .normal)
                yearButton.SetDetailButton(color: UIColor(red: 1, green: 1, blue: 1, alpha: 0.8), size: 60, bold: true)
                yearButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
            }else{
                yearButton.removeFromSuperview()
            }

            //Set lenguague
            if let lenguage = movie.originalLanguage{
                languageButton.setTitle(lenguage, for: .normal)
                languageButton.SetDetailButton(color: UIColor(red: 1, green: 1, blue: 1, alpha: 0.8), size: 10, bold: false)
                languageButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
            }else{
                languageButton.removeFromSuperview()
            }
            
            // Set vote average
            if let vote = movie.voteAverage{
                ratingButton.setTitle(String(vote), for: .normal)
                ratingButton.SetDetailButton(color: UIColor(red: 0.965, green: 0.78, blue: 0, alpha: 1), size: 12, bold: true)
                ratingButton.widthAnchor.constraint(equalToConstant: 78).isActive = true
            }else{
                ratingButton.removeFromSuperview()
            }
            
            if let genders = movie.genreIDS{
                let dao = MoviesDao()
                dao.getGenresDelegate = self
                dao.getGenres()
            }

            // Setting movie plot.
            if let movieDescription = movie.overview{
                let title = "MOVIE PLOT \n"
                let attributeBold: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 14)
                ]
                let attributePlot: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12)
                ]
                var attributedString = NSMutableAttributedString(string: "")
                var attributedTitle = NSAttributedString(string: title, attributes: attributeBold)
                var attributedDescription = NSAttributedString(string: movieDescription, attributes:  attributePlot)
                attributedString.append(attributedTitle)
                attributedString.append(attributedDescription)
                self.movieDescriptionLabel.attributedText = attributedString
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
    
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func addCustomBack(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didTapBackButton))
        self.navigationController?.navigationBar.tintColor = .white
    }

    @IBAction func playVideoPressed(_ sender: Any) {
        
        // https://www.youtube.com/watch?v=UH0KeoB72zs
        guard let videoURL = URL(string: "https://www.youtube.com/watch?v=UH0KeoB72zs") else { return }
    }
}

extension MovieDetailViewController : GetGenresDAODelegate {
    
    func getGenresSuccess(response: GenresResponse) {
        let genresID = movie?.genreIDS ?? []
        let genres = response.genres
        
        let genresOfTheMovie = genres.filter{ genresID.contains($0.id) }
        
        //set label with any gender and the elipse separator.
        var genresTextLabel = ""
        for genre in genresOfTheMovie{
            //Check if is not the last genre of the list
            if genre.id != genresOfTheMovie.last?.id {
                genresTextLabel.append(genre.name)
                genresTextLabel.append(" \u{2022} ")
            }else{
                genresTextLabel.append(genre.name)
            }
        }
        self.genderLabel.text = genresTextLabel
    }
    
    func equalIdGenres(id: Int, genre: Genre) -> Bool{
        return id == genre.id
    }
    
    func getGenresFailure() {
        genderLabel.removeFromSuperview()
    }
    
    
}
