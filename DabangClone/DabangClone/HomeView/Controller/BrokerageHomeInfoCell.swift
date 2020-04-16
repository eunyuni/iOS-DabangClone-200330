//
//  BrokerageHomeTapCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 중개사무소 정보화면
class BrokerageHomeInfoCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "BrokerageHomeTapCell"
  
  // MARK: -Property
  let titleLable = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
    $0.text = "기본정보"
  }
  
  let moldImage = UIImageView().then {
    $0.image = UIImage(named: "moldIcon")
  }
  let brokerageNameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "홍대역공인중개사사무소"
  }
  let representativeLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "김용훈"
  }
  let brokerageNumberLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "11440-2020-00029"
  }
  let businessNumberLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "690-06-00353"
  }
  let csImage = UIImageView().then {
    $0.image = UIImage(named: "csImage")
  }
  let csNumberButton = UIButton().then {
    $0.setTitle("02-324-800", for: .normal)
    $0.setTitleColor(UIColor(named: "roomGuideTextColor"), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
  }
  let addressLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = """
    서울특별시 마포구 동교로 177,
    에이동 1층(동교동)
    """
    $0.numberOfLines = 2
  }
  let addressButton = UIButton().then {
    $0.setTitle("주소복사", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 11)
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 4
  }
  let dateSubscriptionLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "2015년 06월 08일"
  }
  let completionLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "1295개의 방"
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
      moldImage,
      
    ])
    moldImage.addSubviews([
      brokerageNameLabel,
      representativeLabel,
      brokerageNumberLabel,
      businessNumberLabel,
      csImage,
      csNumberButton,
      addressLabel,
      addressButton,
      dateSubscriptionLabel,
      completionLabel
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLable.snp.makeConstraints {
      $0.top.equalToSuperview().inset(16)
      $0.leading.equalToSuperview().inset(24)
    }
    moldImage.snp.makeConstraints {
      $0.top.equalTo(titleLable.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().inset(28)
    }
    brokerageNameLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(18)
      $0.leading.equalToSuperview().offset(130)
    }
    representativeLabel.snp.makeConstraints {
      $0.top.equalTo(brokerageNameLabel.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    brokerageNumberLabel.snp.makeConstraints {
      $0.top.equalTo(representativeLabel.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    businessNumberLabel.snp.makeConstraints {
      $0.top.equalTo(brokerageNumberLabel.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    csImage.snp.makeConstraints {
      $0.top.equalTo(businessNumberLabel.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    csNumberButton.snp.makeConstraints {
      $0.top.equalTo(csImage)
      $0.leading.equalTo(csImage.snp.trailing).offset(4)
      $0.height.equalTo(12)
    }
    addressLabel.snp.makeConstraints {
      $0.top.equalTo(csImage.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    addressButton.snp.makeConstraints {
      $0.top.equalTo(addressLabel.snp.bottom).offset(16)
      $0.leading.equalTo(brokerageNameLabel)
      $0.width.equalTo(60)
    }
    dateSubscriptionLabel.snp.makeConstraints {
      $0.top.equalTo(addressButton.snp.bottom).offset(28)
      $0.leading.equalTo(brokerageNameLabel)
    }
    completionLabel.snp.makeConstraints {
      $0.top.equalTo(dateSubscriptionLabel.snp.bottom).offset(30)
      $0.leading.equalTo(brokerageNameLabel)
    }
    
  }
  
  
}
