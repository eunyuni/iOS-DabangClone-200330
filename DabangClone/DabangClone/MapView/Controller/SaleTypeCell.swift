//
//  SaleTypeCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterSaleTypeCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterRoomTypeCell"
  
  
  // MARK: -Property
  let titleLabel = UILabel().then {
    $0.text = "매물종류"
    $0.font = .systemFont(ofSize: 13, weight: .regular)
  }
  let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  let monthlyButton = UIButton().then {
    $0.setTitle("월세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  let charterButton = UIButton().then {
    $0.setTitle("전세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  let tradingButton = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
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
      monthlyButton,
      charterButton,
      tradingButton,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Padding.topBottom)
      $0.leading.equalToSuperview().offset(16)
    }
    monthlyButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
      $0.width.equalTo(40)
      $0.height.equalTo(32)
    }
    charterButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(monthlyButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(70)
      $0.height.equalTo(monthlyButton)
    }
    tradingButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(charterButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(64)
      $0.height.equalTo(monthlyButton)
    }

    
  }
  
}
