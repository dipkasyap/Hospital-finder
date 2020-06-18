//
//  IllnessCell.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//


import UIKit



class IllnessCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet private  var illnessTitleLabel: UILabel!
    @IBOutlet weak var discloseButton: UIButton! {
        didSet {
            discloseButton.tintColor = AppConstants.Color.discloseButton
        }
        
    }
    
    func setupWith(_ illness: IllnessViewModel) {
        illnessTitleLabel.text = illness.name
        setNeedsDisplay()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
