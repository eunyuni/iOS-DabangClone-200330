//
//  EasySearchTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/06.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 94 16
// 방찾기
class EasySearchTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  static let identifier = "EasySearchTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
    $0.text = "방 찾기 초보를 위한 초간단 솔루션!"
  }
  private let logoImageView = UIImageView().then {
    $0.image = UIImage(named: "easySearchIcon")
  }
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([titleLabel, logoImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(16)
      $0.leading.equalToSuperview().offset(14)
    }
    logoImageView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
      $0.leading.equalToSuperview().offset(14)
      $0.height.equalTo(16)
      $0.width.equalTo(94)
      $0.bottom.equalToSuperview().offset(-20)
    }
  }
}
