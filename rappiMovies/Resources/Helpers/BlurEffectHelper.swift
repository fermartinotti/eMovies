//
//  BlurEffectHelper.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 30/10/2022.
//

import Foundation
import UIKit

class BlurEffectHelper {
    static func blurEffect(frame: CGRect, style: UIBlurEffect.Style) -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        return blurEffectView
    }
}
