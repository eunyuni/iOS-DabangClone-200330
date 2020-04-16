//
//  NewMainRoomViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class NewMainRoomViewController: UIViewController {
  static let frammm = NewMainRoomViewController().view.frame
  
  //MARK: - Property
  let tableView = UITableView()
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    setupUI()
  }
  
  
  //MARK: - SetupUI & SetupContstraints
  
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.register(MainRoomTableViewCell.self, forCellReuseIdentifier: MainRoomTableViewCell.identifier)
    tableView.register(MainRoomSecondTableViewCell.self, forCellReuseIdentifier: MainRoomSecondTableViewCell.identifier)
    view.addSubview(tableView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}

extension NewMainRoomViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainRoomTableViewCell.identifier, for: indexPath) as! MainRoomTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainRoomSecondTableViewCell.identifier, for: indexPath) as! MainRoomSecondTableViewCell
      return cell
    }
  }
}

extension NewMainRoomViewController: UITableViewDelegate {
  
}
