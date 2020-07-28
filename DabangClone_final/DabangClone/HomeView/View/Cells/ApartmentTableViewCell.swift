//
//  ApartmentTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/06.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class ApartmentTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "ApartmentTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
    $0.text = "한라비발디"
  }
  private let detailLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.text = "강원도 원주시 우산동"
    $0.textColor = .lightGray
  }
  private let logoImageView = UIImageView().then {
    $0.image = UIImage(named: "apartmentImage")
  }
  private let apartmentImageView = UIImageView().then {
    $0.image = UIImage(named: "apartmentIcon")
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
    self.contentView.addSubviews([titleLabel,detailLabel,logoImageView,apartmentImageView])
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
      $0.bottom.equalTo(logoImageView.snp.centerY).offset(-2)
    }
    detailLabel.snp.makeConstraints {
      $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
      $0.top.equalTo(logoImageView.snp.centerY).offset(2)
    }
    apartmentImageView.snp.makeConstraints {
      $0.centerY.equalTo(logoImageView.snp.centerY)
      $0.trailing.equalToSuperview().offset(-14)
      $0.height.equalTo(20)
      $0.width.equalTo(42)
    }
  }
}
