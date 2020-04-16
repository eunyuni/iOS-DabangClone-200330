//
//  SaleScheduleCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaleDetailScheduleCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "SaleScheduleCell"
  
  // MARK: -Property
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .bold)
    $0.textColor = .black
    $0.text = "분양 일정"
  }
  let subTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
    $0.text = "! 분양 일정은 건설사 사정에 따라 변경될 수 있습니다"
  }
  let lineView = UIView()
  
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
      titleLabel,
      subTitleLabel,
      lineView,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(26)
      $0.leading.equalToSuperview().offset(26)
    }
    subTitleLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel)
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
    }
    lineView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(0.01)
    }
  }
  

}
