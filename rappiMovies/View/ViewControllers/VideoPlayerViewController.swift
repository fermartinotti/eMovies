//
//  PlayerVideoViewController.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 29/10/2022.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var playerView: YTPlayerView!
    
    
    var videoKey: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        playerView.delegate = self
        playerView.load(withVideoId: videoKey ?? "")
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        activityIndicator.stopAnimating()
        playerView.playVideo()
    }
    
    

}
