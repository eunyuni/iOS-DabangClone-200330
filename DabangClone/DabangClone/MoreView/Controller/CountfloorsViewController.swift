//
//  CountfloorsViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 층 수
class CountfloorsViewController: UIViewController {

  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  private let saveButton = SaveView()
  private let category = ["해당 층 수", "건물 층 수"]
  
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
    
    tableView.register(CFTopTableViewCell.self, forCellReuseIdentifier: CFTopTableViewCell.identifier)
    tableView.register(CFBodyTableViewCell.self, forCellReuseIdentifier: CFBodyTableViewCell.identifier)
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

extension CountfloorsViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: CFTopTableViewCell.identifier, for: indexPath) as! CFTopTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: CFBodyTableViewCell.identifier , for: indexPath) as! CFBodyTableViewCell
      cell.configue(category: category[indexPath.row - 1])
      return cell
    }
  }
}
