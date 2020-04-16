//
//  BrokerageReviewBottomCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BrokerageReviewBottomCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "BrokerageReviewBottomCell"
  
  // MARK: -Property
  
  private let button = UIButton().then {
    $0.setTitle("부동산 리뷰 작성", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.backgroundColor = .white
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
    self.backgroundColor = UIColor(named: "TextFieldColor")
    contentView.addSubviews([
      button,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    button.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    
  }
  
  
}
