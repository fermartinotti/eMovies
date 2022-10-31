//
//  RecommendedTableViewCell.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 30/10/2022.
//

import UIKit

enum FilterType {
    case spanish
    case year2016
}

class RecommendedTableViewCell: UITableViewCell {

    @IBOutlet weak var inSpanishFilterButton: UIButton!
    @IBOutlet weak var yearFilterButton: UIButton!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    private var movies: [Movie] = []
    var filteredMovies : [Movie] = []
    weak var movieSectionSelectedCellDelegate: MovieSectionSelectedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
    
    func configureCell(){
        let dao = MoviesDao()
        dao.getMoviesDelegate = self
        dao.getTopRatedMovies()
        
        inSpanishFilterButton.backgroundColor = .white
        inSpanishFilterButton.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton){
        switch sender.tag{
        case 1:
            //filtrar solo castellano
            inSpanishFilterButton.backgroundColor = .white
            inSpanishFilterButton.setTitleColor(.black, for: .normal)
            
            yearFilterButton.backgroundColor = .black
            yearFilterButton.setTitleColor(.white, for: .normal)
            self.filterMovies(filterType: .spanish)
        case 2:
            inSpanishFilterButton.backgroundColor = .black
            inSpanishFilterButton.setTitleColor(.white, for: .normal)
            
            yearFilterButton.backgroundColor = .white
            yearFilterButton.setTitleColor(.black, for: .normal)
            self.filterMovies(filterType: .year2016)
        default:
            print("default")
        }
    }
    
    private func filterMovies(filterType: FilterType){
        switch filterType{
        case .spanish:
            filteredMovies = movies.filter {$0.originalLanguage == "es"}
        case .year2016:
            filteredMovies = movies.filter {$0.releaseDate!.contains("2020")}
        }
        moviesCollectionView.reloadData()
    }

}

extension RecommendedTableViewCell: GetMoviesDAODelegate{
    func getMoviesSuccess(movies: MoviesResponse) {
        if let results = movies.results{
            self.movies = results
            self.filteredMovies = results
            self.filterMovies(filterType: .spanish)
        }
    }
    
    func getMoviesFailure() {
        //TODO: Revisar que hacer.
    }
    
    
}

extension RecommendedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(6, filteredMovies.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.configureCell(movie: filteredMovies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.filteredMovies[indexPath.row]
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
