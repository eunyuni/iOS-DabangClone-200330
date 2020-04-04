//
//  FilterRoomTypeCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterRoomTypeCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "FilterRoomTypeCell"
  
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "방 종류"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let oneRoomButton = UIButton().then {
    $0.setTitle("원룸", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let twoRoomButton = UIButton().then {
    $0.setTitle("투∙쓰리룸", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let officetelButton = UIButton().then {
    $0.setTitle("오피스텔", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let apartButton = UIButton().then {
    $0.setTitle("아파트", for: .normal)
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
      oneRoomButton,
      twoRoomButton,
      officetelButton,
      apartButton,
    
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Padding.topBottom)
      $0.leading.equalToSuperview().offset(16)
    }
    oneRoomButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
      $0.width.equalTo(40)
      $0.height.equalTo(32)
    }
    twoRoomButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(oneRoomButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(70)
      $0.height.equalTo(oneRoomButton)
    }
    officetelButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(twoRoomButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(64)
      $0.height.equalTo(oneRoomButton)
    }
    apartButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(officetelButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(54)
      $0.height.equalTo(oneRoomButton)
    }
    
  }
  

}
