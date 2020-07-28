//
//  FileteAddCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FileteAddCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FileteAddCell"
  
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "추가 필터"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  private let buttonView1 = FilterTwoButtonView()
  private let buttonView2 = FilterTwoButtonView()
  private let buttonView3 = FilterTwoButtonView()
  private let buttonView4 = FilterTwoButtonView()
  private let buttonView5 = FilterTwoButtonView()
  
  private let commentLabel = UILabel().then {
    $0.text = "❀풀옵션 항목은 세탁기, 냉장고, 에어컨, 가스렌지 또는 인덕션입니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    buttonView1.configue(leftButton: "주차가능", rightButton: "반려동물")
    buttonView2.configue(leftButton: "단기임대", rightButton: "풀옵션")
    buttonView3.configue(leftButton: "빌트인", rightButton: "엘리베이터")
    buttonView4.configue(leftButton: "베란다/발코니", rightButton: "전세자금대출")
    buttonView5.configue(leftButton: "보안/안전시설", rightButton: "360ºVR")
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
      buttonView1,
      buttonView2,
      buttonView3,
      buttonView4,
      buttonView5,
      commentLabel
      
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
    buttonView1.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
    }
    buttonView2.snp.makeConstraints {
      $0.top.equalTo(buttonView1.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
    }
    buttonView3.snp.makeConstraints {
      $0.top.equalTo(buttonView2.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
    }
    buttonView4.snp.makeConstraints {
      $0.top.equalTo(buttonView3.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
    }
    buttonView5.snp.makeConstraints {
      $0.top.equalTo(buttonView4.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
      
    }
    commentLabel.snp.makeConstraints {
      $0.top.equalTo(buttonView5.snp.bottom).offset(12)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
    }
  }
  
}
