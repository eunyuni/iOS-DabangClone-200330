//
//  HomeTopTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/05.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 페이지
class HomeTopTableViewCell: UITableViewCell {

  // MARK: - Identifier
  static let identifier = "HomeTopTableViewCell"
  // MARK: - Property
  private let logoImageView = UIImageView().then {
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
    self.contentView.addSubviews([logoImageView,topLabel])
    contentView
    self.contentView
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    logoImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.height.equalTo(28)
      $0.width.equalTo(68)
    }
    topLabel.snp.makeConstraints {
      $0.top.equalTo(logoImageView.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.bottom.equalToSuperview().offset(-10)
    }
  }
}
