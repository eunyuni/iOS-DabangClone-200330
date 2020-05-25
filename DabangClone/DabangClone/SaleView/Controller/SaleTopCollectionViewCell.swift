//
//  SaleTopCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 탑 셀
class SaleTopCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    static let identifier = "SaleTopCollectionViewCell"
    // MARK: - Property
  private var imageView = UIImageView()
//      .then {
//      $0.image = UIImage(named: "SaleMainImage1")
//      $0.layer.cornerRadius = 4
//      $0.clipsToBounds = true
//    }
    // MARK: - Init
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupUI()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    func configue(_ image: MainImageTheme) {
      self.imageView.image = image.image
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
