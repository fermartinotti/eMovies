//
//  GoToMovieDetailAnimator.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 23/10/2022.
//

import Foundation
import UIKit

class GoToMovieDetailAnimator: NSObject {

}

extension GoToMovieDetailAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let toVC = transitionContext.viewController(forKey: .to) as? MovieDetailViewController,
            let fromVC = transitionContext.viewController(forKey: .from) as? HomeViewController else {
            return
        }
        
        let toView = transitionContext.view(forKey: .to)
        
        if let view = toView {
            transitionContext.containerView.addSubview(view)
        }
        
        toView?.frame = fromVC.cellSelected!.frame
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let frame = transitionContext.finalFrame(for: toVC)
        //toVC.titleLabel.alpha = 0.0
        
        UIView.animate(withDuration: duration, animations: {
            //toVC.titleLabel.alpha = 1.0
            toView?.frame = frame
            toView?.layoutIfNeeded()
        }) { (success) in
            transitionContext.completeTransition(true)
        }
    }
}
