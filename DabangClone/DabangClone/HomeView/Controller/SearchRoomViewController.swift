//
//  SearchRoomViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 방찾기
class SearchRoomViewController: UIViewController {
  // MARK: - Property
  private let topView = UIView().then {
    $0.backgroundColor = UIColor(named: "LightGrayColor")
  }
  private let cancelButton = UIButton().then {
    $0.setImage(UIImage(named: "cancelButton"), for: .normal)
  }
  private let textField = UITextField().then {
    $0.placeholder = "어반빌리움 수유"
  }
  private let searchImageView = UIImageView().then {
    $0.image = UIImage(named: "searchIcon")?.withTintColor(.lightGray)
  }
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.register(EasySearchTableViewCell.self, forCellReuseIdentifier: EasySearchTableViewCell.identifier)
    $0.register(UniversityTableViewCell.self, forCellReuseIdentifier: UniversityTableViewCell.identifier)
    $0.register(SubwayTableViewCell.self, forCellReuseIdentifier: SubwayTableViewCell.identifier)
    $0.register(ApartmentTableViewCell.self, forCellReuseIdentifier: ApartmentTableViewCell.identifier)
    $0.register(OfficetelTableViewCell.self, forCellReuseIdentifier: OfficetelTableViewCell.identifier)
    $0.register(AreaTableViewCell.self, forCellReuseIdentifier: AreaTableViewCell.identifier)
  }
  
  private let eventImageView = UIImageView().then {
    $0.image = UIImage(named: "eventImage")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  //  university, subway, apartment, officetel , area
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    tableView.dataSource = self
    self.view.addSubviews([topView,tableView,eventImageView])
    self.topView.addSubviews([cancelButton, textField, searchImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    topView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.13)
    }
    cancelButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(14)
      $0.leading.equalToSuperview().offset(14)
    }
    textField.snp.makeConstraints {
      $0.top.equalTo(cancelButton.snp.bottom).offset(18)
      $0.leading.equalToSuperview().offset(14)
      $0.trailing.equalTo(searchImageView.snp.leading).offset(-10)
    }
    searchImageView.snp.makeConstraints {
      $0.centerY.equalTo(textField.snp.centerY)
      $0.trailing.equalToSuperview().offset(-14)
      $0.width.height.equalTo(18)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(eventImageView.snp.top)
    }
    eventImageView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(90)
      
    }
  }
}


extension SearchRoomViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: EasySearchTableViewCell.identifier, for: indexPath) as! EasySearchTableViewCell
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: UniversityTableViewCell.identifier, for: indexPath) as! UniversityTableViewCell
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: SubwayTableViewCell.identifier, for: indexPath) as! SubwayTableViewCell
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentTableViewCell.identifier, for: indexPath) as! ApartmentTableViewCell
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: OfficetelTableViewCell.identifier, for: indexPath) as! OfficetelTableViewCell
      return cell
    case 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: AreaTableViewCell.identifier, for: indexPath) as! AreaTableViewCell
      return cell
    default:
      return UITableViewCell()
    }
  }
}
