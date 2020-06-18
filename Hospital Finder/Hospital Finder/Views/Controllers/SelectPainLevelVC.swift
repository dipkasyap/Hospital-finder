//
//  SelectPainLevelVC.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit

class SelectPainLevelVC: UIViewController {
    
    @IBOutlet var painLevelButtons: [PainLevelButton]!
    
    //MARK:- View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- Actions
extension SelectPainLevelVC {
    
    @IBAction func didSelectPainLevel(_ sender: PainLevelButton) {
        painLevelButtons.forEach { (btn) in
            btn.isSelected = btn == sender
        }
        let painLevel = PainLevel(rawValue: sender.tag)
    }
    
    fileprivate func showHospitals(forIllness illness: IllnessViewModel  ) {
        let hospitalListVC: HospitalListVC = UIStoryboard(storyboard: .hospital).instantiateViewController()
        navigationController?.pushViewController(hospitalListVC, animated: true)
    }
}
