//
//  HomeCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/03.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "HomeCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "sampleImage")
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let titleLabel = UILabel().then {
    $0.text = "송파동"
    $0.layer.cornerRadius = 30
    $0.clipsToBounds = true
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = .white
    $0.backgroundColor = .blue
    $0.alpha = 00.8
  }
  private let detailLabel = UILabel().then {
    $0.text = "원룸, 투・쓰리룸, 오피스텔"
    $0.font = .systemFont(ofSize: 15)
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
    self.contentView.addSubviews([imageView, titleLabel, detailLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom)
      $0.leading.equalToSuperview()
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
  }
}
