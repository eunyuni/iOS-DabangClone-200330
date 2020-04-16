//
//  SaleDetailRecommendCollectionCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/15.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaleDetailRecommendCollectionCell: UICollectionViewCell {
  
  // MARK: - Identifier
  static let identifier = "SaleDetailRecommendCollectionCell"
  
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "SampleImage")
    $0.layer.cornerRadius = 4
    //      $0.clipsToBounds = true
  }
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
  }
  private let subTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
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
  func configue(title: String, subTitle: String) {
    self.titleLabel.text = title
    self.subTitleLabel.text = subTitle
  }
  
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([
      imageView,
      titleLabel,
      subTitleLabel,
    ])
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(2)
    }
    subTitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(2)
      $0.bottom.equalToSuperview().inset(4)
    }
  }
}
