//
//  StoryboardHelper.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
import UIKit


protocol StoryboardIdentifiable {
  static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
}

extension UIViewController: StoryboardIdentifiable { }

 extension UIStoryboard {
    
   ///  If there are multiple storyboards in the project, each one must be named here:
  enum Storyboard: String {
    //TODO: Add new storyboards name here................ if applicable.....
    case hospital = "Hospital"
    }
  
  convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
    self.init(name: storyboard.rawValue, bundle: bundle)
  }
  
  class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
    return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
  }
    
    /// Returns the UIViewController from storyboard with identifier same as class name 
    /// - Returns: UIViewController
  func instantiateViewController<T: UIViewController>() -> T {
    guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
      fatalError("\n\nCould not find view controller with name \(T.storyboardIdentifier)\n\n")
    }
    
    return viewController
  }
}
