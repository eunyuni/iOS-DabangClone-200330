//
//  AddressApartView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 아파트 주소검색 - 정덕
class AddressApartView: UIView {
  // MARK: - Identifier
  // MARK: - Property
  private let topLabel = UILabel().then {
    $0.text = "지역 및 단지명을 선택해주세요"
  }
  private let topView = UIView()
  private let doView = AddressTextView().then {
    $0.configue(title: "시/도 검색")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
  }
  private let siView = AddressTextView().then {
    $0.configue(title: "시/군/구 선택")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
  }
  private let dongView = AddressTextView().then {
    $0.configue(title: "동/면/읍 선택")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    
  }
  
  private let dangiTextField = UITextField().then {
    $0.placeholder = "단지명을 입력해주세요."
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding()
  }
  private let searchButton = UIButton().then {
    $0.setTitle("검색하기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  
  private let tableView = UITableView()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    tableView.delegate = self
    tableView.dataSource = self
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    self.addSubviews([topLabel, topView, dongView, dangiTextField, searchButton , tableView])
    topView.addSubviews([doView, siView])
    setupConstraint()
  }
  
  // MARK: - Layout
  private func setupConstraint() {
    topLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(10)
    }
    topView.snp.makeConstraints {
      $0.top.equalTo(topLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalToSuperview().multipliedBy(0.08)
    }
    doView.snp.makeConstraints {
      $0.top.leading.bottom.equalToSuperview()
      //      $0.width.equalToSuperview().multipliedBy(0.5)
      $0.trailing.equalTo(topView.snp.centerX).offset(-0.8)
    }
    siView.snp.makeConstraints {
      $0.top.trailing.bottom.equalToSuperview()
      //      $0.width.equalToSuperview().multipliedBy(0.5)
      $0.leading.equalTo(topView.snp.centerX)
    }
    
    dongView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    dangiTextField.snp.makeConstraints {
      $0.top.equalTo(dongView.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    searchButton.snp.makeConstraints {
      $0.top.equalTo(dangiTextField.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(searchButton.snp.bottom).offset(10)
      $0.bottom.leading.trailing.equalToSuperview()
    }
  }
  
}
extension AddressApartView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    UITableViewCell()
  }
  
  
}

extension AddressApartView: UITableViewDelegate {
  
}
