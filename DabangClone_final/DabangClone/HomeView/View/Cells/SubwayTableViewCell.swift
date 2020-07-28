//
//  SubwayTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/06.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SubwayTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "SubwayTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.text = "건대입구역"
  }
  private let logoImageView = UIImageView().then {
    $0.image = UIImage(named: "subwayImage")
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
    self.contentView.addSubviews([titleLabel,logoImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    logoImageView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(17)
      $0.leading.equalToSuperview().inset(14)
      $0.height.width.equalTo(23)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
      $0.centerY.equalTo(logoImageView.snp.centerY)
    }
  }
}
