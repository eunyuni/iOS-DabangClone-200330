//
//  HomeSaleCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/17.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class HomeSaleCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "HomeSaleCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "saleEmptyImage")
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let saleTypeLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 11)
    $0.textColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.8276094794, green: 0, blue: 0.08192314953, alpha: 1)
    $0.layer.cornerRadius = 10
  }
  private let titleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.8276094794, green: 0, blue: 0.08192314953, alpha: 1)
    $0.font = .systemFont(ofSize: 14)
  }
  private let detailLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 15)
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
  func configue(data: SaleHomeData) {
    self.titleLabel.text = data.title
    self.detailLabel.text = data.detail
    self.saleTypeLabel.text = data.type
    self.imageView.image = UIImage(named: data.image)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([imageView,saleTypeLabel, titleLabel, detailLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    saleTypeLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(6)
      $0.leading.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(6)
      $0.leading.equalTo(saleTypeLabel.snp.trailing).offset(4)
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(saleTypeLabel.snp.bottom).offset(6)
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
  }
}
