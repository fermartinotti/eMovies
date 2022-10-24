//
//  GoToMovieDetailSegue.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 23/10/2022.
//

import Foundation
import UIKit


class GoToMovieDetailSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension GoToMovieDetailSegue: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return GoToMovieDetailAnimator()
    }
}


