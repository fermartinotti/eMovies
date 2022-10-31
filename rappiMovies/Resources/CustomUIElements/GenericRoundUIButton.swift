//
//  GenericRoundUIButton.swift
//  rappiMovies
//
//  Created by Hector Fernando Martinotti on 30/10/2022.
//

import Foundation
import UIKit

class GenericRoundUIButton : UIButton{
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupStyle()
    }
    
    func setupStyle(){
        self.backgroundColor = .black
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 12)
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 0.75
        self.layer.borderColor = UIColor(red: 0.558, green: 0.558, blue: 0.558, alpha: 1).cgColor
        self.tintColor = .clear
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                self.backgroundColor = .white
                self.setTitleColor(.black, for: .selected)
            }else{
                self.backgroundColor = .black
                self.setTitleColor(.white, for: .normal)
            }

        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setupStyle()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.setupStyle()
    }
    
}
