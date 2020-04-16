//
//  BrokerageReviewTapCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 중개사무소리뷰
class BrokerageReviewTopCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "BrokerageReviewTapCell"
  
  // MARK: -Property
  let titleLable = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
    $0.text = "부동산 리뷰"
  }
  let subLable = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = UIColor(named: "roomGuideTextColor")
    $0.text = "0개"
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
    titleLable,
    subLable,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    titleLable.snp.makeConstraints {
      $0.top.equalToSuperview().offset(18)
      $0.bottom.equalToSuperview().inset(8)
      $0.leading.equalToSuperview().offset(24)
    }
    subLable.snp.makeConstraints {
      $0.top.equalTo(titleLable)
      $0.leading.equalTo(titleLable.snp.trailing).offset(4)
    }
    
  }
  

}
