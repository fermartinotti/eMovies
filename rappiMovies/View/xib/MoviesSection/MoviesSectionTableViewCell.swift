//
//  CarrouselMoviesTableViewCell.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 22/10/2022.
//

import UIKit

protocol MovieSectionSelectedCellDelegate:AnyObject{
    func didSelectMovie(movie: Movie, poster: UIImage, cell: MovieCollectionViewCell)
}

class MoviesSectionTableViewCell: UITableViewCell {

    var movies: [Movie]?
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    weak var movieSectionSelectedCellDelegate: MovieSectionSelectedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }

    func configureCell(type: SectionType){
        let dao = MoviesDao()
        dao.getMoviesDelegate = self
        switch type{
        case .upcoming:
            sectionTitleLabel.text = "Próximos estrenos"
            dao.getUpcomingMovies()
        case .trending:
            sectionTitleLabel.text = "Tendencia"
            dao.getTopRatedMovies()
        default:
            print("error")
        }
    }
    
}

extension MoviesSectionTableViewCell: GetMoviesDAODelegate{
    
    func getMoviesSuccess(movies: MoviesResponse) {
        if let results = movies.results{
            self.movies = results
        }
        moviesCollectionView.reloadData()
    }
    
    func getMoviesFailure() {
        //TODO: Cambiar y manejar apropiadamente
        print("error al obtener datos")
    }
    
}
    
extension MoviesSectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movies = movies{
            return movies.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.configureCell(movie: movies![indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.movies![indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as! MovieCollectionViewCell
        if let image = cell.posterImageView.image{
            movieSectionSelectedCellDelegate?.didSelectMovie(movie: movie, poster: image, cell: cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

