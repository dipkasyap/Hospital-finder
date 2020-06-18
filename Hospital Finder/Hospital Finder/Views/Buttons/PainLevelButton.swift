//
//  SmileyButton.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit


class  PainLevelButton: UIButton {
    
    override var isSelected: Bool{
        didSet {
            toggle()
        }
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.cgPath
        layer.borderWidth = 1
        
        
        toggle()
    }
    
    private func toggle() {
        if isSelected {
            layer.borderColor = UIColor.red.cgColor
        } else {
            layer.borderColor = UIColor.clear.cgColor
        }
    }
}

