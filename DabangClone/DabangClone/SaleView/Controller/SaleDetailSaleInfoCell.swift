//
//  SaleDetailSectionBodyCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/13.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양상세화면 → 분양세대 (간략)정보
class SaleDetailSaleInfoCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "SaleDetailSaleInfoCell"
  
  // MARK: -Property
  
  // 건물 유형
  private let buildingType = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "건물 유형"
  }
  private let buildingTypeLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 공급 유형
  private let supplyType = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "공급 유형"
  }
  private let supplyTypeLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 총/분양 세대 수
  private let totalHouseholds = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "총/분양 세대 수"
  }
  private let totalHouseholdsLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 단지 규모
  private let sizeComplex = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "단지 규모"
  }
  private let sizeComplexLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 전용 면적
  private let exclusiveArea = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "전용 면적"
  }
  private let exclusiveAreaLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 건설사
  private let constructionCompany = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "건설사"
  }
  private let constructionCompanyLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 시행사
  private let pilotCompany = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "시행사"
  }
  private let pilotCompanyLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 규제기간
  private let regulatoryPeriod = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "규제기간"
  }
  private let regulatoryPeriodLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 기타
  private let others = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "기타"
  }
  private let othersLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 공고문
  private let publicNotice = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "공고문"
  }
  private let publicNoticeButton = UIButton().then {
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
    let title = "입주자 모집 공고문"
    let titleString = NSMutableAttributedString(string: title)
    titleString.addAttribute(
      .underlineStyle,
      value: NSUnderlineStyle.single.rawValue,
      range: NSRange(location: 0, length: title.count)
    )
    titleString.addAttribute(
      .foregroundColor,
      value: UIColor.black ,
      range: NSRange(location: 0, length: title.count))
    $0.setAttributedTitle(titleString, for: .normal)
  }
  
  private let arrowLabel = UILabel().then {
    $0.text = "〉"
    $0.font = .systemFont(ofSize: 14, weight: .regular)
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
  
  func configue(buildingType: String, supplyType: String, totalHouseholds: String, sizeComplex: String, exclusiveArea: String, constructionCompany: String, pilotCompany: String, regulatoryPeriod: String, others: String) {
    self.buildingTypeLable.text = buildingType
    self.supplyTypeLable.text = supplyType
    self.totalHouseholdsLabel.text = totalHouseholds
    self.sizeComplexLabel.text = sizeComplex
    self.exclusiveAreaLabel.text = exclusiveArea
    self.constructionCompanyLabel.text = constructionCompany
    self.pilotCompanyLabel.text = pilotCompany
    self.regulatoryPeriodLabel.text = regulatoryPeriod
    self.othersLable.text = others
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      buildingType,
      buildingTypeLable,
      supplyType,
      supplyTypeLable,
      totalHouseholds,
      totalHouseholdsLabel,
      sizeComplex,
      sizeComplexLabel,
      exclusiveArea,
      exclusiveAreaLabel,
      constructionCompany,
      constructionCompanyLabel,
      pilotCompany,
      pilotCompanyLabel,
      regulatoryPeriod,
      regulatoryPeriodLabel,
      others,
      othersLable,
      publicNotice,
      publicNoticeButton,
      arrowLabel,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    buildingType.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(26)
    }
    supplyType.snp.makeConstraints {
      $0.top.equalTo(buildingType.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    totalHouseholds.snp.makeConstraints {
      $0.top.equalTo(supplyType.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    sizeComplex.snp.makeConstraints {
      $0.top.equalTo(totalHouseholds.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    exclusiveArea.snp.makeConstraints {
      $0.top.equalTo(sizeComplex.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    constructionCompany.snp.makeConstraints {
      $0.top.equalTo(exclusiveArea.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    pilotCompany.snp.makeConstraints {
      $0.top.equalTo(constructionCompany.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    regulatoryPeriod.snp.makeConstraints {
      $0.top.equalTo(pilotCompany.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    others.snp.makeConstraints {
      $0.top.equalTo(regulatoryPeriod.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    publicNotice.snp.makeConstraints {
      $0.top.equalTo(others.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
      $0.bottom.equalToSuperview().inset(26)
    }
    
    
    buildingTypeLable.snp.makeConstraints {
      $0.top.equalTo(buildingType)
      $0.leading.equalTo(totalHouseholds.snp.trailing).offset(6)
    }
    supplyTypeLable.snp.makeConstraints {
      $0.top.equalTo(supplyType)
      $0.leading.equalTo(buildingTypeLable)
    }
    totalHouseholdsLabel.snp.makeConstraints {
      $0.top.equalTo(totalHouseholds)
      $0.leading.equalTo(buildingTypeLable)
    }
    sizeComplexLabel.snp.makeConstraints {
      $0.top.equalTo(sizeComplex)
      $0.leading.equalTo(buildingTypeLable)
    }
    exclusiveAreaLabel.snp.makeConstraints {
      $0.top.equalTo(exclusiveArea)
      $0.leading.equalTo(buildingTypeLable)
    }
    constructionCompanyLabel.snp.makeConstraints {
      $0.top.equalTo(constructionCompany)
      $0.leading.equalTo(buildingTypeLable)
    }
    pilotCompanyLabel.snp.makeConstraints {
      $0.top.equalTo(pilotCompany)
      $0.leading.equalTo(buildingTypeLable)
    }
    regulatoryPeriodLabel.snp.makeConstraints {
      $0.top.equalTo(regulatoryPeriod)
      $0.leading.equalTo(buildingTypeLable)
    }
    othersLable.snp.makeConstraints {
      $0.top.equalTo(others)
      $0.leading.equalTo(buildingTypeLable)
    }
    publicNoticeButton.snp.makeConstraints {
      $0.top.equalTo(publicNotice)
      $0.leading.equalTo(buildingTypeLable)
      $0.height.equalTo(16)
    }
    arrowLabel.snp.makeConstraints {
      $0.top.equalTo(publicNotice)
      $0.leading.equalTo(publicNoticeButton.snp.trailing).offset(4)
    }
  }
  
  
}
