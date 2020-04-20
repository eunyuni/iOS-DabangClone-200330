//
//  HomeRecommendedCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/17.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class HomeRecommendedCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "HomeRecommendedCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "saleEmptyImage")
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let titleLabel = UILabel().then {
    $0.text = "공적마우스 판매쳐 어쩌구 저쩌구"
    $0.font = .boldSystemFont(ofSize: 15)
  }
  private let dabangLabel = UILabel().then {
    $0.text = "다방"
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let detailLabel = UILabel().then {
    $0.text = "조회 49,183"
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = UIColor(named: "DetailColor")
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
  
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([imageView, titleLabel, dabangLabel, detailLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
    }
    dabangLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
    detailLabel.snp.makeConstraints {
      $0.centerY.equalTo(dabangLabel.snp.centerY)
      $0.leading.equalTo(dabangLabel.snp.trailing).offset(4)
    }
  }
}
