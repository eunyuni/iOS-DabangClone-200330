//
//  HomeInterestCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/17.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class HomeInterestCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "HomeInterestCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "saleEmptyImage")
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let countLabel = UILabel().then {
    $0.textColor = .white
    $0.layer.cornerRadius = 5
    $0.clipsToBounds = true
    $0.font = .boldSystemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "regulationColor")
    $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
  }
  private let titleLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 15)
  }
  private let detailLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = #colorLiteral(red: 0.6077951789, green: 0.6078702807, blue: 0.6077696681, alpha: 1)
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
  func configue(data: InterestApart) {
    self.titleLabel.text = data.title
    self.detailLabel.text = data.detail
    self.imageView.image = UIImage(named: data.image)
  }
  
  func configue(data: InterestRoom) {
    self.titleLabel.text = data.title
    self.detailLabel.text = data.detail
    self.imageView.image = UIImage(named: data.image)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([imageView, titleLabel, detailLabel])
    self.imageView.addSubviews([countLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    countLabel.snp.makeConstraints {
      $0.leading.bottom.equalToSuperview()
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(8)
      $0.leading.equalToSuperview()
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
      $0.leading.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-4)
    }
  }
}
