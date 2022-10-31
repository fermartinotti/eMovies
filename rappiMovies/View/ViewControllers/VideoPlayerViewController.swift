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
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet var playerView: YTPlayerView!
    
    
    var videoKey: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        let blur = BlurEffectHelper.blurEffect(frame: self.view.frame, style: .dark)
        self.view.insertSubview(blur, at: 0)
        view.isOpaque = false
        closeImageView.image = UIImage(systemName: "xmark.circle.fill")
        closeImageView.tintColor = .white
        activityIndicator.startAnimating()
        playerView.delegate = self
        playerView.load(withVideoId: videoKey ?? "")
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        activityIndicator.stopAnimating()
        playerView.playVideo()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: false)
    }
    

}
