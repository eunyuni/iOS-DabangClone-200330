//
//  BrokerageHomeBottomCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 중개사무소 홈탭/대표소속공인중개사무소
class BrokerageHomeBottomCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "BrokerageHomeBottomCell"
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 17, weight: .bold)
    $0.textColor = .black
    $0.text = "대표 및 소속 공인중개사"
  }
  private let profileImage = UIImageView().then {
    $0.image = UIImage(named: "ProfileIcon")
  }
  private let nameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "김용훈"
  }
  private let subLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.textColor = .gray
    $0.text = "대표공인중개사"
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
        titleLabel,
        profileImage,
        nameLabel,
        subLabel
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.leading.equalToSuperview().offset(24)
    }
    profileImage.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
//      $0.bottom.equalToSuperview().inset(20)
//      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.169)
      $0.height.equalTo(self.snp.width).multipliedBy(0.169)
      $0.leading.equalToSuperview().offset(34)
    }
    nameLabel.snp.makeConstraints {
      $0.top.equalTo(profileImage.snp.bottom).offset(6)
      $0.centerX.equalTo(profileImage)
    }
    subLabel.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(4)
      $0.centerX.equalTo(nameLabel)
      $0.bottom.equalToSuperview().inset(20)
    }
    
  }
  

}
