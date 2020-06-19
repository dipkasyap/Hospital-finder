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
    @IBOutlet weak var discloseButton: UIButton!
    
    func setupWith(_ illness: IllnessViewModel) {
        illnessTitleLabel.text = illness.name
        setNeedsDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        illnessTitleLabel.textColor = AppConstants.Color.subtitleGray
        discloseButton.tintColor = AppConstants.Color.appRed
    }
    
}
