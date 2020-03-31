//
//  RoomSizeViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/31.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 방내놓기 - 기본정보 - 방 크기
class RoomSizeViewController: UIViewController {

  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  private let saveButton = SaveView()
  private let category = ["전용면적", "공급면적"]
  
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
    
    tableView.register(RSTopTableViewCell.self, forCellReuseIdentifier: RSTopTableViewCell.identifier)
    tableView.register(RSBodyTableViewCell.self, forCellReuseIdentifier: RSBodyTableViewCell.identifier)
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

extension RoomSizeViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: RSTopTableViewCell.identifier, for: indexPath) as! RSTopTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: RSBodyTableViewCell.identifier , for: indexPath) as! RSBodyTableViewCell
      cell.configue(category: category[indexPath.row - 1])
      return cell
    }
  }
}
