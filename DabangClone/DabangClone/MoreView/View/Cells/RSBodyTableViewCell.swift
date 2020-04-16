//
//  RSBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/31.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RSBodyTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "RSBodyTableViewCell"
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 17, weight: .regular)
  }
  private let arrowTextField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.keyboardType = .numberPad
    $0.addLeftPadding(20)
  }
  private let spaceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.text = "평"
  }
  let arrowImage = UIImageView().then {
    $0.image = UIImage(named: "arrowIcon")
  }
  private let meterTextField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.keyboardType = .numberPad
    $0.addLeftPadding(20)
  }
  let meterImage = UIImageView().then {
    $0.image = UIImage(named: "meterIcon")
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
   
   func configue(category: String) {
     titleLabel.text = category
   }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      
      titleLabel,
      arrowTextField,
      spaceLabel,
      arrowImage,
      meterTextField,
      meterImage
    
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalToSuperview().offset(24)
    }
    arrowTextField.snp.makeConstraints {
      $0.leading.equalTo(titleLabel)
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.width.equalToSuperview().multipliedBy(0.34)
      $0.height.equalTo(50)
      $0.bottom.equalToSuperview().offset(-16)
    }
    spaceLabel.snp.makeConstraints {
      $0.leading.equalTo(arrowTextField.snp.trailing).offset(8)
      $0.centerY.equalTo(arrowTextField)
    }
    arrowImage.snp.makeConstraints {
      $0.top.equalTo(spaceLabel)
      $0.centerX.equalToSuperview()
    }
    meterTextField.snp.makeConstraints {
      $0.leading.equalTo(arrowImage.snp.trailing).offset(12)
      $0.top.equalTo(arrowTextField)
      $0.height.equalTo(arrowTextField)
      $0.width.equalTo(arrowTextField)
    }
    meterImage.snp.makeConstraints {
      $0.leading.equalTo(meterTextField.snp.trailing).offset(8)
      $0.centerY.equalTo(arrowTextField)
    }
    
  }
}


// MARK: -UITextFieldDelegate
// 키보드 터치, 내려가도록
extension RSBodyTableViewCell: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
