//
//  BrokerageTestViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BrokerageTestViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    //    $0.separatorStyle = .none
    $0.register(BrokerageOfficeTopCell.self, forCellReuseIdentifier: BrokerageOfficeTopCell.identifier)
    $0.register(BrokerageHomeInfoCell.self, forCellReuseIdentifier: BrokerageHomeInfoCell.identifier)
    $0.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
    $0.register(BrokerageHomeBottomCell.self, forCellReuseIdentifier: BrokerageHomeBottomCell.identifier)
    $0.register(BrokerageReviewTopCell.self, forCellReuseIdentifier: BrokerageReviewTopCell.identifier)
        $0.register(BrokerageReviewBodyCell.self, forCellReuseIdentifier: BrokerageReviewBodyCell.identifier)
    //    $0.register(BrokerageHomeBottomCell.self, forCellReuseIdentifier: BrokerageHomeBottomCell.identifier)
    $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
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
    ])
    tableView.backgroundColor = .white
    
    
    tableView.dataSource = self
    //    tableView.delegate = self
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}

// MARK: -UITableViewDataSource

extension BrokerageTestViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageHomeInfoCell.identifier, for: indexPath) as! BrokerageHomeInfoCell
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier, for: indexPath) as! GrayLineViewCell
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageHomeBottomCell.identifier, for: indexPath)
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageReviewTopCell.identifier, for: indexPath)
      return cell
      case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageReviewBodyCell.identifier, for: indexPath)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }
}
