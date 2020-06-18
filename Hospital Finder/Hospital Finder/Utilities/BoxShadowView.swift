//
//  ShadowView.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit

class  BoxShadowView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowPath = shadowPath.cgPath
    }
}




