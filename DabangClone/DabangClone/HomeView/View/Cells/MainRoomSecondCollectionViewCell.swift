//
//  MainRoomSecondCollectionViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MainRoomSecondCollectionViewCell: UICollectionViewCell {
  static let identifier = "MainRoomSecondCollectionViewCell"
  
  
  let imageView = UIImageView()
  let optionLabel = UILabel().then {
    $0.text = "옵션"
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 18, weight: .light)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addSubview(imageView)
    addSubview(optionLabel)
    
    imageView.snp.makeConstraints {
      $0.width.height.equalTo(40)
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview()
    }
    
    optionLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    }
    imageView.clipsToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
