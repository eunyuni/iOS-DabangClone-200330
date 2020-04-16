//
//  PriceBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class PriceBottomTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "PriceBottomTableViewCell"
  
  // MARK: -Property
  let button = UIButton().then {
    $0.setTitle("입력", for: .normal)
    $0.setTitleColor(.lightGray, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderColor = UIColor.black.cgColor
    $0.layer.borderWidth = 1.0
    $0.layer.cornerRadius = 4
  }
  private let bottomLine = UIView().then {
    $0.backgroundColor = .gray
    $0.alpha = 0.4
  }
  private let bottomGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      button,
      bottomLine,
      bottomGrayView
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    button.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
      
    }
    bottomLine.snp.makeConstraints {
      $0.top.equalTo(button.snp.bottom).offset(24)
//      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    bottomGrayView.snp.makeConstraints {
      $0.top.equalTo(bottomLine.snp.bottom)
      $0.width.equalToSuperview()
      $0.height.equalTo(6)
      $0.bottom.equalToSuperview()
    }
  }
  

}
