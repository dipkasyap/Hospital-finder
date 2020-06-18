//
//  TableviewCell+Extenssion.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell:  ReusableView {}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
