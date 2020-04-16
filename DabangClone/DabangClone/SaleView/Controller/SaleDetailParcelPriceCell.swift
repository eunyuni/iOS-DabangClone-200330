//
//  SaleParcelPriceCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양상세화면 → 분양가(있을수도 없을수도)
class SaleDetailParcelPriceCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "SaleDetailParcelPriceCell"
  
  // MARK: -Property
  
  //분양가
  private let parcelPrice = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .bold)
    $0.textColor = .black
    $0.text = "분양가"
  }
  private let parcelPriceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 19, weight: .bold)
    $0.textColor = UIColor(named: "roomGuideTextColor")
  }
  
  // 평단가
  private let flatPrice = UILabel().then {
    $0.textColor = .black
    $0.attributedText = NSMutableAttributedString().bold("평단가 ", fontSize: 12).normal("(만원/3.3㎡당)", fontSize: 12)
  }
  private let flatPriceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 19, weight: .bold)
    $0.textColor = UIColor(named: "roomGuideTextColor")
  }
  private let commentLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
    $0.text = "최근 6개월 이 지역 평균 평단가"
  }
  private let averageLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
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
  
  func configue(parcelPriceLabel: String, flatPriceLabel: String, averageLabel: String) {
    self.parcelPriceLabel.text = parcelPriceLabel
    self.flatPriceLabel.text = flatPriceLabel
    self.averageLabel.text = averageLabel
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      parcelPrice,
      parcelPriceLabel,
      flatPrice,
      flatPriceLabel,
      commentLabel,
      averageLabel
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    parcelPrice.snp.makeConstraints {
      $0.top.equalToSuperview().offset(26)
      $0.leading.equalToSuperview().offset(26)
    }
    parcelPriceLabel.snp.makeConstraints {
      $0.leading.equalTo(parcelPrice)
      $0.top.equalTo(parcelPrice.snp.bottom).offset(6)
    }
    flatPrice.snp.makeConstraints {
      $0.top.equalTo(parcelPrice)
      $0.trailing.equalToSuperview().inset(36)
    }
    flatPriceLabel.snp.makeConstraints {
      $0.leading.equalTo(flatPrice)
      $0.top.equalTo(parcelPriceLabel)
    }
    commentLabel.snp.makeConstraints {
      $0.leading.equalTo(parcelPrice)
      $0.top.equalTo(parcelPriceLabel.snp.bottom).offset(6)
      $0.bottom.equalToSuperview().inset(26)
    }
    averageLabel.snp.makeConstraints {
      $0.leading.equalTo(flatPriceLabel)
      $0.top.equalTo(flatPriceLabel.snp.bottom).offset(6)
    }
  }
  
  
}
