//
//  HomeView.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/03.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class HomeView: UIView {

  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "dabangIcon")
  }
  private let topLabel = UILabel().then {
    $0.text =
    """
    어떤 동네, 어떤 방에서
    살고 싶으신가요?
    """
    $0.numberOfLines = 2
    $0.font = .systemFont(ofSize: 27)
  }
  private let searchView = UIView().then {
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.blue.cgColor
  }
  private let searchLabel = UILabel().then {
    $0.text = "어반빌리움 수유"
    $0.font = .systemFont(ofSize: 17)
  }
  private let searchImageView = UIImageView().then {
    $0.image = UIImage(named: "searchIcon")
  }
  private let tableView = UITableView().then {
    $0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
  }
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    tableView.dataSource = self
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([imageView,topLabel,searchView,tableView])
    searchView.addSubviews([searchLabel,searchImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.height.equalTo(28)
      $0.width.equalTo(68)
    }
    topLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    searchView.snp.makeConstraints {
      $0.top.equalTo(topLabel.snp.bottom).offset(30)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }
    searchLabel.snp.makeConstraints {
      $0.centerY.equalTo(searchView.snp.centerY)
      $0.leading.equalTo(searchView.snp.leading).offset(8)
    }
    searchImageView.snp.makeConstraints {
      $0.centerY.equalTo(searchView.snp.centerY)
      $0.trailing.equalTo(searchView.snp.trailing).offset(-8)
      $0.height.width.equalTo(18)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(searchView.snp.bottom).offset(10)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension HomeView : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
    return UITableViewCell()
  }
  
  
}
