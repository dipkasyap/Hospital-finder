//
//  UIView+Extension.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    func zoomIn() {

        let scale: CGFloat = 0.95
        let duration: TimeInterval = 0.1
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }) { (completed) in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }
}
