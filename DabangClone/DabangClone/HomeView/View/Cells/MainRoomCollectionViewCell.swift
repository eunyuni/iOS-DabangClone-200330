//
//  MainRoomCollectionViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/07.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MainRoomCollectionViewCell: UICollectionViewCell {
  static let identifier = "MainRoomCollectionViewCell"
  
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
