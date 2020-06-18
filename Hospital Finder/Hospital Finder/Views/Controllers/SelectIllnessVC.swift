//
//  SelectIllnessVC.swift
//  Hospital Finder
//
//  Created by Admin on 18/6/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SelectIllnessVC: UIViewController {

    @IBOutlet weak var illnessTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getIllness()
    }
}



extension SelectIllnessVC {
    
    private func getIllness() {
        IllnessListViewModel().getIlleness()
    }
}



extension SelectIllnessVC {
    fileprivate func selectHospitals() {
        let hospitalListVC: HospitalListVC = UIStoryboard(storyboard: .hospital).instantiateViewController()
        navigationController?.pushViewController(hospitalListVC, animated: true)
    }
}
