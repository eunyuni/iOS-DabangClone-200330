//
//  ParkingFeeViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/31.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 주차비
class ParkingFeeViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  private let saveButton = SaveView()
  
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
    
    tableView.register(PriceTopTableViewCell.self, forCellReuseIdentifier: PriceTopTableViewCell.identifier)
    tableView.register(PriceBodyTableViewCell.self, forCellReuseIdentifier: PriceBodyTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    
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

extension ParkingFeeViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: PriceTopTableViewCell.identifier, for: indexPath) as! PriceTopTableViewCell
      cell.configue(title: "주차비를 입력하세요.")
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: PriceBodyTableViewCell.identifier , for: indexPath) as! PriceBodyTableViewCell
      cell.configue(category: "주차비", labelCheck: false)
      return cell
    }
  }
}

