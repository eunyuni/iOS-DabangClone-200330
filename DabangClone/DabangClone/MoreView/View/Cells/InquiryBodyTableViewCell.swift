//
//  InquiryBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class InquiryBodyTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "InquiryBodyTableViewCell"
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "제목"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  private let textField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding(20)
  }
  private let contentLabel = UILabel().then {
    $0.text = "내용"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  let textView = UITextView().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.addLeftPadding()
    $0.font = .systemFont(ofSize: 14)
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
      titleLabel,
      textField,
      contentLabel,
      textView,
      
    ])
    textView.delegate = self
    textView.text = "문의 내용을 입력하세요."
    textView.textColor = UIColor.lightGray
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalToSuperview().offset(24)
    }
    textField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    contentLabel.snp.makeConstraints {
      $0.top.equalTo(textField.snp.bottom).offset(12)
      $0.leading.equalTo(titleLabel)
    }
    textView.snp.makeConstraints {
      $0.top.equalTo(contentLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(textField).multipliedBy(2.4)
      $0.bottom.equalToSuperview().offset(-26)
    }
    
  }
}

extension InquiryBodyTableViewCell: UITextViewDelegate {
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.lightGray {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }
  
  // TextView Place Holder
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "문의 내용을 입력하세요."
      textView.textColor = UIColor.lightGray
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  
}
