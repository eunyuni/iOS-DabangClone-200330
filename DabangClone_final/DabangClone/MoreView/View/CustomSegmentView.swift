//
//  CustomSegmentView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CustomSegmentView: UIView {
  
  let addressButton = UIButton().then {
    $0.setTitle("주소", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.tintColor = .blue
  }
  
  let baseInfoButton = UIButton().then {
    $0.setTitle("기본정보", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.tintColor = .blue
  }
  
  let addInfoButton = UIButton().then {
    $0.setTitle("추가정보", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.tintColor = .blue
  }
  
  let explainInfoButton = UIButton().then {
    $0.setTitle("설명", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.tintColor = .blue
  }
  
  let bezel1 = Graybezel()
  let bezel2 = Graybezel()
  let bezel3 = Graybezel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    backgroundColor = .lightGray
    addSubviews([addressButton, baseInfoButton, addInfoButton, explainInfoButton, bezel1, bezel2, bezel3])
    setupConstraints()
  }
  
  private func setupConstraints() {
    addressButton.snp.makeConstraints {
      $0.leading.top.bottom.equalToSuperview()
      $0.width.equalTo(50)
    }
    
    baseInfoButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalTo(addressButton.snp.trailing)
      $0.width.equalTo(70)
    }
    
    addInfoButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      
      $0.centerX.equalTo(self.snp.trailing).multipliedBy(0.652)
      $0.width.equalTo(70)
    }
    
    explainInfoButton.snp.makeConstraints {
      $0.top.bottom.trailing.equalToSuperview()
      $0.width.equalTo(50)
    }
    
    
    bezel1.snp.makeConstraints {
      $0.leading.equalTo(addInfoButton.snp.trailing)
      $0.trailing.equalTo(baseInfoButton.snp.leading)
      $0.height.equalTo(1)
      $0.centerY.equalToSuperview()
    }
    bezel2.snp.makeConstraints {
      $0.leading.equalTo(baseInfoButton.snp.trailing)
      $0.trailing.equalTo(addInfoButton.snp.leading)
      $0.height.equalTo(1)
      $0.centerY.equalToSuperview()
    }
    bezel3.snp.makeConstraints {
      $0.leading.equalTo(addInfoButton.snp.trailing)
      $0.trailing.equalTo(explainInfoButton.snp.leading)
      $0.height.equalTo(1)
      $0.centerY.equalToSuperview()
    }
  }
  
}


