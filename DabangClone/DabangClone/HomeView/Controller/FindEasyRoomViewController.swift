//
//  FindEasyRoomViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 홈뷰 - 검색 - 쉬운 방 찾기
class FindEasyRoomViewController: UIViewController {
  
  // MARK: -Property
  private let headerView = FindHeaderView()
  private let bottomView = FindBottomView()
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
    //    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    view.backgroundColor = UIColor(named: "LightGrayColor")
    
    view.addSubviews([
      headerView,
      bottomView,
      tableView,
    ])
    tableView.backgroundColor = .white
    
    tableView.register(FindTitleCell.self, forCellReuseIdentifier: FindTitleCell.identifier)
    tableView.register(FindAreaTypeCell.self, forCellReuseIdentifier: FindAreaTypeCell.identifier)
    tableView.register(FindRoomConditionCell.self, forCellReuseIdentifier: FindRoomConditionCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    let guide = view.safeAreaLayoutGuide
    headerView.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(100)
    }
    bottomView.snp.makeConstraints {
      $0.height.equalTo(160)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(headerView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(bottomView.snp.top)
    }
  }
  
}

// MARK: -UITableViewDataSource

extension FindEasyRoomViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 9
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindTitleCell.identifier, for: indexPath) as! FindTitleCell
      cell.configue(titleLabel: "많이 찾는 지역")
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindAreaTypeCell.identifier, for: indexPath) as! FindAreaTypeCell
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindTitleCell.identifier, for: indexPath) as! FindTitleCell
      cell.configue(titleLabel: "방이 많은 조건")
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "월세+관리비 50 이하 원룸")
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "보증금 500 이하 원룸")
      return cell
    case 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "반려동물 가능한 원룸")
      return cell
    case 6:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "옥탑방 원룸")
      return cell
    case 7:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "2억 이하 전세 투쓰리룸")
      return cell
    case 8:
      let cell = tableView.dequeueReusableCell(withIdentifier: FindRoomConditionCell.identifier, for: indexPath) as! FindRoomConditionCell
      cell.configue(buttonLabel: "전세자금대출 가능한 투쓰리룸")
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }
}
