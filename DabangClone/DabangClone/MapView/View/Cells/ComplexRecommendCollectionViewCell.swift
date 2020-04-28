//
//  ComplexRecommendCollectionViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexRecommendCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "ComplexRecommendCollectionViewCell"
  
  // MARK: - Property
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "SampleImage")
    $0.layer.cornerRadius = 4
    //      $0.clipsToBounds = true
  }
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .white
  }
  //      private let subTitleLabel = UILabel().then {
  //        $0.font = .systemFont(ofSize: 14, weight: .regular)
  //        $0.textColor = .black
  //      }
  private let titleView = UIView().then {
    $0.backgroundColor = UIColor(named: "totalTextColor")
    $0.alpha = 0.8
    $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    $0.layer.cornerRadius = 10
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
  func configue(title: String) {
    self.titleLabel.text = title
  }
  
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubview(imageView)
    imageView.addSubviews([
      titleView,
      titleLabel,
    ])
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
    titleView.snp.makeConstraints {
      $0.leading.bottom.equalToSuperview().inset(1.4)
      $0.height.equalToSuperview().multipliedBy(0.2)
      // width는 글자수만큼 해야하는데......어캐해??? ??
      $0.width.equalToSuperview().multipliedBy(0.6)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.bottom.equalTo(titleView).inset(4)
      
    }
    
  }
}
