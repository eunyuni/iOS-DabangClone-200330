//
//  PriceBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class PriceBodyTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "PriceBodyTableViewCell"
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = ""
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let measureLabel = UILabel().then {
    $0.text = "만 원"
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .lightGray
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "전세는 전세금만 입력하세요."
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.textColor = UIColor(named: "DabangLightBlue")
  }
  private let textField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.placeholder = "0"
    $0.keyboardType = .numberPad
    $0.addLeftPadding(20)
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
  
  func configue(category: String, labelCheck: Bool) {
    titleLabel.text = category
    if labelCheck {
      contentView.addSubviews([subTitleLabel])
      textField.snp.makeConstraints {
        $0.bottom.equalTo(subTitleLabel.snp.top).offset(-8).priority(.high)
      }
      subTitleLabel.snp.makeConstraints {
        $0.leading.equalTo(titleLabel)
        $0.bottom.equalToSuperview().offset(-8)
      }
    }
  }
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      titleLabel,
      measureLabel,
      textField,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalToSuperview().offset(24)
    }
    measureLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel)
      $0.trailing.equalToSuperview().offset(-24)
    }
    textField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
      $0.bottom.equalToSuperview().offset(-16).priority(.low)
    }
    
  }
}

// MARK: -UITextFieldDelegate

extension PriceBodyTableViewCell: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
