//
//  ImageViewCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/10.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 가이드 이미지 셀
class ImageViewCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "ImageViewCollectionViewCell"
  // MARK: - Property
  private let imageView = UIImageView()
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue( imageName: String) {
    imageView.image = UIImage(named: imageName)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([imageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}
