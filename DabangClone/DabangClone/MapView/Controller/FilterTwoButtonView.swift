//
//  TwoButtonView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterTwoButtonView: UIView {

   // MARK: -Property
  var leftButton = UIButton().then {
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.cornerRadius = 4
    $0.layer.borderColor = UIColor.lightGray.cgColor
        
  }
  var rightButton = UIButton().then {
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.cornerRadius = 4
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  
   // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue(leftButton: String, rightButton: String) {
    self.leftButton.setTitle(leftButton, for: .normal)
    self.rightButton.setTitle(rightButton, for: .normal)
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubviews([
      leftButton,
      rightButton,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    leftButton.snp.makeConstraints {
      $0.top.leading.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.49)
    }
    
    rightButton.snp.makeConstraints {
      $0.top.trailing.bottom.equalToSuperview()
      $0.width.equalTo(leftButton)
      
    }
    
  }
  
}
