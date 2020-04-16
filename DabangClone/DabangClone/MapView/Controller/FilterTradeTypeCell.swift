//
//  FilterTradeTypeCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/05.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterTradeTypeCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterTradeTypeCell"
  
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "거래 종류"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  private let brokerageButton = UIButton().then {
    $0.setTitle("중개", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let directButton = UIButton().then {
    $0.setTitle("직거래", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
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
      titleLabel,
      subTitleLabel,
      brokerageButton,
      directButton
      
    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Padding.topBottom)
      $0.leading.equalToSuperview().offset(16)
    }
    subTitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel)
      $0.leading.equalTo(titleLabel.snp.trailing).offset(6)
    }
    brokerageButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
      $0.width.equalTo(40)
      $0.height.equalTo(32)
    }
    directButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(brokerageButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(44)
      $0.height.equalTo(brokerageButton)
    }
  }
}
