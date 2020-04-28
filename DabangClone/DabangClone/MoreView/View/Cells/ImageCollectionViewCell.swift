//
//  ImageCollectionViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "ImageCollectionViewCell"
  // MARK: - Property
  private var imageView = UIImageView()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue(firstImage image: UIImage) {
    imageView.image = image
  }
  func configue(secondeImage image: UIImage) {
    imageView.image = image
    imageView.layer.cornerRadius = 4
    imageView.clipsToBounds = true
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubview(imageView)
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}
