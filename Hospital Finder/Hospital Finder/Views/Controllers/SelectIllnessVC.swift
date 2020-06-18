//
//  SelectIllnessVC.swift
//  Hospital Finder
//
//  Created by Devi Pd Ghimire on 18/6/20.
//  Copyright © 2020 Devi Pd Ghimire. All rights reserved.
//

import UIKit


class SelectIllnessVC: UIViewController {
    
    @IBOutlet weak var illnessTableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    private var illnessListViewModel: IllnessListViewModel = IllnessListViewModel()
    
    //MARK:- View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getIllness()
    }
}


//MARK:- UI Setup
extension SelectIllnessVC {
    private func setupUI() {
        illnessTableView.register(IllnessCell.self)
        illnessTableView.separatorStyle = .none
        refreshControl.addTarget(self, action: #selector(getIllness), for: .valueChanged)
        illnessTableView.addSubview(refreshControl)
        illnessTableView.dataSource = self
        illnessTableView.delegate = self
    }
}


//MARK:- Service call
extension SelectIllnessVC {
    @objc private func getIllness() {
        illnessListViewModel.getIlleness{ [weak self] success, error in
            if success {
                //reload table
                self?.illnessTableView.reloadData()
            } else {
                //show error alert
            }
            self?.refreshControl.endRefreshing()
        }
    }
}

//MARK:- Actions
extension SelectIllnessVC {
    fileprivate func showHospitals(forIllness illness: IllnessViewModel  ) {
        let hospitalListVC: HospitalListVC = UIStoryboard(storyboard: .hospital).instantiateViewController()
        navigationController?.pushViewController(hospitalListVC, animated: true)
    }
}


//MARK:- Tableview datasource
extension SelectIllnessVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return illnessListViewModel.numbersOfIllness
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: IllnessCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setupWith(illnessListViewModel.illness(forIndex: indexPath.row))
        return cell
        
    }
}

//MARK:- Tableview delegate
extension SelectIllnessVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.zoomIn()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
            self.showHospitals(forIllness: self.illnessListViewModel.illness(forIndex: indexPath.row))
        }
    }
}

