//
//  UIButton+Extensions.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 24/10/2022.
//

import Foundation
import UIKit

extension UIButton{
    
    func SetDetailButton(color: UIColor, size: CGFloat, bold: Bool){
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = color
        self.layer.cornerRadius = 5
        
        
        if bold{
            self.titleLabel?.font = .boldSystemFont(ofSize: size)
        }else{
            self.titleLabel?.font = .systemFont(ofSize: size)
        }
    }
    
}
