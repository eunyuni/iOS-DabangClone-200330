//
//  SaleDetailSectionCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/13.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양상세화면 → 분양가 | 분양세대수 | 모집공고 | 입주예정일
class SaleDetailSectionCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "SaleDetailSectionCell"
  
  // MARK: -Property
  
  // 분양가
  private let parcelPrice = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "분양가"
  }
  private let parcelPriceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 분양 세대 수
  private let parcelhousehold = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "분양 세대 수"
  }
  private let parcelhouseholdLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 모집공고
  private let recruitmentNotice = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "모집 공고"
  }
  private let recruitmentNoticeLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 입주예정일
  private let scheduledDate = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "입주 예정일"
  }
  private let scheduledDateLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  private let moldImage = UIImageView().then {
    $0.image = UIImage(named: "SaleTapImage")
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
  
  func configue(parcelPrice: String, parcelhousehold:String, recruitmentNotice: String, scheduledDate: String) {
    self.parcelPriceLabel.text = parcelPrice
//    self.parcelPriceLabel.text = "\(parcelPrice)"
    self.parcelhouseholdLabel.text = parcelhousehold
    self.recruitmentNoticeLabel.text = recruitmentNotice
    self.scheduledDateLabel.text = scheduledDate
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
      moldImage,
      parcelPrice,
      parcelPriceLabel,
      parcelhousehold,
      parcelhouseholdLabel,
      recruitmentNotice,
      recruitmentNoticeLabel,
      scheduledDate,
      scheduledDateLabel,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    moldImage.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(16)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.centerY.equalToSuperview()
      $0.centerX.equalToSuperview()
    }
    parcelPrice.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(26)
      $0.top.equalToSuperview().offset(20)
    }
    parcelPriceLabel.snp.makeConstraints {
      $0.leading.equalTo(parcelPrice)
      $0.top.equalTo(parcelPrice.snp.bottom)
    }
    parcelhousehold.snp.makeConstraints {
      $0.leading.equalTo(parcelPrice.snp.trailing).offset(66)
      $0.top.equalTo(parcelPrice)
    }
    parcelhouseholdLabel.snp.makeConstraints {
      $0.leading.equalTo(parcelhousehold)
      $0.top.equalTo(parcelPriceLabel)
    }
    recruitmentNotice.snp.makeConstraints {
      $0.leading.equalTo(parcelhousehold.snp.trailing).offset(50)
      $0.top.equalTo(parcelPrice)
    }
    recruitmentNoticeLabel.snp.makeConstraints {
      $0.leading.equalTo(recruitmentNotice)
      $0.top.equalTo(parcelPriceLabel)
    }
    scheduledDate.snp.makeConstraints {
      $0.leading.equalTo(recruitmentNotice.snp.trailing).offset(72)
      $0.top.equalTo(parcelPrice)
    }
    scheduledDateLabel.snp.makeConstraints {
      $0.leading.equalTo(scheduledDate)
      $0.top.equalTo(parcelPriceLabel)
    }
  }
  
  
}
