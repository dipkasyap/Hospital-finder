//
//  IllnessCell.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//


import UIKit



class IllnessCell: UITableViewCell, NibLoadableView {
    
    
    func setupWith(_ illness: String) {
        
        
        setNeedsDisplay()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        containerView.backgroundColor = AppConstants.Color.mportLightGray
//        selectionStyle = .none
//        selectionColor = AppConstants.Color.mportLightGray
//        setSelected(false, animated: false)
    }
}
