//
//  FindHeaderView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FindHeaderView: UIView {

  
  // MARK: -Property
  let closeButton = UIButton().then {
    $0.setTitle("✕", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 21, weight: .regular)
  }
  let titleLabel = UILabel().then {
    $0.text = "원하는 지역과 조건을 선택하세요."
    $0.font = .systemFont(ofSize: 18, weight: .regular)
  }
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.backgroundColor = UIColor(named: "LightGrayColor")
//    self.backgroundColor = .li/ghtGray
    self.addSubviews([
      closeButton,
      titleLabel
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    closeButton.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(8)
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(closeButton.snp.bottom).offset(20)
      $0.leading.equalToSuperview().inset(10)
      $0.bottom.equalToSuperview().inset(10)
    }
    
  }
  

}
