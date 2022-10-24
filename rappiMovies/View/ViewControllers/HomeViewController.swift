//
//  HomeViewController.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 19/10/2022.
//

import UIKit

class HomeViewController: UIViewController{

    @IBOutlet weak var sectionsTableView: UITableView!
    private var tableContent: [MoviesSection]  = []
    
    private var movieSelected: Movie?
    private var posterOfMovieSelected: UIImage?
    
    var cellSelected: MovieCollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        tableContent.append(MoviesSection(type: .upcoming))
        tableContent.append(MoviesSection(type: .trending))
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{

    private func configureTableView(){
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.register(UINib(nibName: "MoviesSectionTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesSectionTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableContent[indexPath.row].type{
        case .upcoming:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesSectionTableViewCell", for: indexPath) as! MoviesSectionTableViewCell
            cell.movieSectionSelectedCellDelegate = self
            cell.configureCell(type: .upcoming)
            return cell
        case .trending:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesSectionTableViewCell", for: indexPath)as! MoviesSectionTableViewCell
            cell.configureCell(type: .trending)
            cell.movieSectionSelectedCellDelegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
}

extension HomeViewController: MovieSectionSelectedCellDelegate{
    func didSelectMovie(movie: Movie, poster: UIImage, cell: MovieCollectionViewCell) {
        movieSelected = movie
        posterOfMovieSelected = poster
        cellSelected = cell
        performSegue(withIdentifier: "GoToMovieDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMovieDetail"{
            let destination = segue.destination as! MovieDetailViewController
            if let poster = posterOfMovieSelected, let movie = movieSelected{
                destination.movie = movie
                destination.poster = poster
            }
        }
    }
    
}
