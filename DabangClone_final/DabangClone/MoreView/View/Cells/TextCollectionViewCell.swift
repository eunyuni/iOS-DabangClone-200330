//
//  TextCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 아파트 주소찾기 시/도/동 정덕
class TextCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "TextCollectionViewCell"
  // MARK: - Property
  private let titleLabel = UILabel()
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
    self.addSubviews([titleLabel])
    
    self.contentView.layer.borderWidth = 0.6
    self.contentView.layer.borderColor = UIColor.lightGray.cgColor
    self.contentView.layer.cornerRadius = 4
    setupConstraint()
  }
  // 스퀘드 체제
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
