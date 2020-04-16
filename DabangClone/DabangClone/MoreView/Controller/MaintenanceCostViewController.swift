//
//  MaintenanceCostViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 관리비
class MaintenanceCostViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  private let saveButton = SaveView()
  private let category = ["전기세", "수도세", "인터넷", "청소비", "도시가스", "유선TV", "기타"]
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    view.addSubviews([
      tableView,
      saveButton,
      
    ])
    
    tableView.register(MCTopTableViewCell.self, forCellReuseIdentifier: MCTopTableViewCell.identifier)
    tableView.register(MCBottomTableViewCell.self, forCellReuseIdentifier: MCBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
//    tableView.delegate = self
    tableView.backgroundColor = .white
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    saveButton.snp.makeConstraints {
      $0.height.equalTo(60)
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      
    }
    tableView.snp.makeConstraints {
      
      $0.top.equalToSuperview()
      $0.bottom.equalTo(saveButton.snp.top)
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }
  
}

// MARK: -UITableViewDataSource

extension MaintenanceCostViewController: UITableViewDataSource {
  
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return 1
//  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return category.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MCTopTableViewCell.identifier, for: indexPath)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MCBottomTableViewCell.identifier , for: indexPath) as! MCBottomTableViewCell
      cell.configue(category: category[indexPath.row - 1])
      return cell
    }
    
  }
  
}


// MARK: - Set TableView
//extension MaintenanceCostViewController: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let headerView = MCHeaderView()
//    headerView.backgroundColor = .white
//    //    headerView.section = section
//    return headerView
//  }
//}


