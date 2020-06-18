//
//  IllnessCell.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//


import UIKit



class HospitalCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet private  var hospitalNameLabel: UILabel!
    @IBOutlet private  var waitingTimeLabel: UILabel!
    @IBOutlet private  var waitingTimeValueLabel: UILabel!
    
    func setupWith(_ hospital: HospitalViewModel) {
        hospitalNameLabel.text = hospital.name
        waitingTimeValueLabel.text = hospital.waitingTime.toReadableTime
        setNeedsDisplay()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
