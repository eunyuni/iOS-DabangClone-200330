//
//  ComplexCollectionViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexCollectionViewCell: UICollectionViewCell {
  static let identifier = "ComplexCollectionViewCell"
  
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    imageView.clipsToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
