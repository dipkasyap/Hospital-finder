//
//  ProgressHud.swift
//  Hospital Finder
//
//  Created by Admin on 19/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import Foundation
import SVProgressHUD

//MARK:- Progress Hud
class ProgressHud: NSObject {
    
    class func showIn(_ view: UIView){
        SVProgressHUD.show()
        SVProgressHUD.setContainerView(view)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor (UIColor.black.withAlphaComponent(0.4))
        SVProgressHUD.setForegroundColor (AppConstants.Color.hospitalBlue)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setRingNoTextRadius(20)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
    }
    
    class func showSuccessIn(_ view: UIView){
        SVProgressHUD.showSuccess(withStatus: "Success")
        SVProgressHUD.setMinimumDismissTimeInterval(1)
         SVProgressHUD.setMaximumDismissTimeInterval(1)
        SVProgressHUD.setContainerView(view)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor (UIColor.black.withAlphaComponent(0.4))
        SVProgressHUD.setForegroundColor (AppConstants.Color.hospitalBlue)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setRingNoTextRadius(20)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
    }
    
    
    class func hide(){
        SVProgressHUD.dismiss()
    }
    
}


