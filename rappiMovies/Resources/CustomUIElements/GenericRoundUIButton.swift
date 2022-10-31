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
        self.layer.cornerRadius = 21
        self.layer.borderWidth = 0.75
        self.layer.borderColor = UIColor(red: 0.558, green: 0.558, blue: 0.558, alpha: 1).cgColor
        
        //TODO: revisar
//        if #available(iOS 15.0, *) {
//            self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15)
//        } else {
//            self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
//        }
        
    }
    
//    override var isSelected: Bool{
//        didSet{
//            if isSelected{
//                self.backgroundColor = .white
//                self.setTitleColor(.black, for: .normal)
//                //self.setTitleColor(.black, for: .normal)
//            }else{
//                self.backgroundColor = .black
//                self.setTitleColor(.white, for: .normal)
//            }
//        }
//    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setupStyle()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.setupStyle()
    }
    
}
