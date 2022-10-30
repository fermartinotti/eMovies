//
//  TransparentButtonç.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 28/10/2022.
//

import Foundation
import UIKit

class TransparentButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStyle()
    }
    
    required init?(coder:NSCoder){
        super.init(coder: coder)
        self.setupStyle()
    }
    
    func setupStyle(){
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
        self.layer.cornerRadius = 8
    }
    
}
