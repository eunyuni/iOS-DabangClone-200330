//
//  BrokerageOfficeSectionCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 중개사무소 섹션부분 (홈,방,리뷰)
class BrokerageOfficeSectionCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "BrokerageOfficeSectionCell"
  
  // MARK: -Property
  let homeButton = UIButton().then {
    $0.setTitle("홈", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
  }
  let homeLine = UIView().then {
    $0.backgroundColor = .black
  }
  let roomButton = UIButton().then {
    $0.setTitle("방(10)", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
  }
  let roomLine = UIView().then {
    $0.backgroundColor = .black
  }
  let reviewButton = UIButton().then {
    $0.setTitle("리뷰(0)", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
  }
  let reviewLine = UIView().then {
    $0.backgroundColor = .black
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
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
    contentView.addSubviews([
      homeButton,
      homeLine,
      roomButton,
      roomLine,
      reviewButton,
      reviewLine
    
    
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    roomButton.snp.makeConstraints {
      $0.top.bottom.equalTo(homeButton)
      $0.centerY.equalToSuperview()
    }
    homeButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(2)
    
    }
    
    reviewButton.snp.makeConstraints {
      $0.top.bottom.equalTo(homeButton)
    }
    
  }
  

}
