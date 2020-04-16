//
//  SaleDetailBottomView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/15.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaleDetailBottomView: UIView {
  // MARK: -Property
  private let topView = UIView().then {
    $0.backgroundColor = .gray
    $0.alpha = 0.6
  }
  private let callButton = UIButton().then {
    $0.setTitle("전화로 문의하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = UIColor(named: "roomGuideTextColor")
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    $0.layer.cornerRadius = 4
//    $0.layer.borderColor = UIColor.gray.cgColor
//    $0.layer.borderWidth = 0.6
  }
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupUI()
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue() {
    
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubviews([
      callButton,
      topView,
      ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    topView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.height.equalTo(0.5)
      $0.width.equalToSuperview()
    }
    callButton.snp.makeConstraints { 
//      $0.edges.equalToSuperview().inset(10)
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
  }
  

}
