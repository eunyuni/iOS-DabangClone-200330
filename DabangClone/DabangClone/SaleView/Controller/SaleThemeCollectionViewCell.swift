//
//  SaleThemeCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/10.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SaleThemeCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "SaleThemeCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView()
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.numberOfLines = 2
  }
  private let firstLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.backgroundColor = .lightGray
  }
  private let secondLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.backgroundColor = .lightGray
  }
  private let thirdLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.backgroundColor = .lightGray
  }
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue( theme : Theme) {
    imageView.image = UIImage(named: theme.imageName)
    titleLabel.text = theme.title
    firstLabel.text = theme.first
    secondLabel.text = theme.second
    thirdLabel.text = theme.third
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.backgroundColor = .white
    self.contentView.layer.cornerRadius = 4
    self.contentView.addSubviews([imageView,titleLabel,firstLabel,secondLabel,thirdLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(13)
      $0.height.width.equalTo(40)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(10)
      $0.centerY.equalTo(imageView.snp.centerY)
    }
    firstLabel.snp.makeConstraints {
      $0.bottom.leading.equalToSuperview().inset(14)
    }
    secondLabel.snp.makeConstraints {
      $0.leading.equalTo(firstLabel.snp.trailing).offset(7)
      $0.centerY.equalTo(firstLabel.snp.centerY)
    }
    thirdLabel.snp.makeConstraints {
      $0.leading.equalTo(secondLabel.snp.trailing).offset(7)
      $0.centerY.equalTo(firstLabel.snp.centerY)
    }
  }
}
