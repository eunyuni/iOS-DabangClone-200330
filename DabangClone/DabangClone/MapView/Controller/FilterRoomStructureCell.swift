//
//  FilterRoomStructureCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterRoomStructureCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterRoomStructureCell"
  
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "방 구조"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  private let frameView = FilterTwoButtonView()

  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    frameView.configue(leftButton: "주방 분리형(1.5룸)", rightButton: "복층")
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
      frameView,
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
    frameView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(32)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
    }
    
  }
  
  
}
