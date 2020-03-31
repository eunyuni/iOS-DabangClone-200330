//
//  RSTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/31.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RSTopTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "RSTopTableViewCell"
  
  // MARK: -Property
  private let label = UILabel().then {
    $0.text = "전용면적과 공급면적을 입력하세요"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let button = UIButton().then {
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    let title = "전용면적과 공급면적이란?"
    let titleString = NSMutableAttributedString(string: title)
    titleString.addAttribute(
      .underlineStyle,
      value: NSUnderlineStyle.single.rawValue,
      range: NSRange(location: 0, length: title.count)
    )
    titleString.addAttribute(
      .foregroundColor,
      value: UIColor(named: "SaveButtonColor"),
      range: NSRange(location: 0, length: title.count))
    $0.setAttributedTitle(titleString, for: .normal)
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
      label,
      button
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    label.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(16)
    }
    button.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(label.snp.bottom)
      $0.bottom.equalTo(-16)
    }
  }
}
