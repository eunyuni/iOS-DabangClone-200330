//
//  InquiryViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 더보기 - 1:1 문의
class InquiryViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  private let category = "문의유형"
  
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
    
    tableView.register(CFBodyTableViewCell.self, forCellReuseIdentifier: CFBodyTableViewCell.identifier)
    tableView.register(InquiryBodyTableViewCell.self, forCellReuseIdentifier: InquiryBodyTableViewCell.identifier)
    tableView.register(InquiryBottomTableViewCell.self, forCellReuseIdentifier: InquiryBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    
    setupConstraint()
    
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    tableView.snp.makeConstraints {
      
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
}

// MARK: -UITableViewDataSource

extension InquiryViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: CFBodyTableViewCell.identifier , for: indexPath) as! CFBodyTableViewCell
      cell.configue(category: category, pickerType: .문의)
      return cell
    } else if indexPath.row == 1{
      let cell = tableView.dequeueReusableCell(withIdentifier: InquiryBodyTableViewCell.identifier , for: indexPath) as! InquiryBodyTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: InquiryBottomTableViewCell.identifier, for: indexPath) as! InquiryBottomTableViewCell
      return cell
    }
  }
}
