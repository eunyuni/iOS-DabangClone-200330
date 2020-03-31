//
//  PriceViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 가격
class PriceViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  private let saveButton = SaveView()
  private let category = ["보증금(전세금)", "월세"]
  
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
    tableView.register(PriceBottomTableViewCell.self, forCellReuseIdentifier: PriceBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    //    tableView.delegate = self
    //    tableView.backgroundColor = UIColor(named: "SaveTextColor")
    
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

extension PriceViewController: UITableViewDataSource {
  
  //  func numberOfSections(in tableView: UITableView) -> Int {
  //    return 1
  //  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    if indexPath.row == 0 {
    //      let cell = tableView.dequeueReusableCell(withIdentifier: PriceTopTableViewCell.identifier, for: indexPath) as! PriceTopTableViewCell
    //      return cell
    //    } else if indexPath.row == 1 {
    //      let cell = tableView.dequeueReusableCell(withIdentifier: PriceBodyTableViewCell.identifier , for: indexPath) as! PriceBodyTableViewCell
    //      cell.configue(category: category[indexPath.row - 1])
    ////      return cell
    //      return cell
    //    } else {
    //      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //      return cell
    //    }
    //
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: PriceTopTableViewCell.identifier, for: indexPath) as! PriceTopTableViewCell
      cell.configue(title: "가격을 입력하세요.")
      return cell
    case 1, 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: PriceBodyTableViewCell.identifier , for: indexPath) as! PriceBodyTableViewCell
      if indexPath.row == 1 {
        cell.configue(category: category[indexPath.row - 1], labelCheck: true)
        return cell
      }
      cell.configue(category: category[indexPath.row - 1], labelCheck: false)
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: PriceBottomTableViewCell.identifier, for: indexPath)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }
  
}
