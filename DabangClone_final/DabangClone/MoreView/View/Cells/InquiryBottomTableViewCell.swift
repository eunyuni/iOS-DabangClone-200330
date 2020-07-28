//
//  InquiryBottomTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/02.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class InquiryBottomTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "InquiryBottomTableViewCell"
  
  // MARK: -Property
  
  let completeButton = UIButton().then {
    $0.setTitle("전송하기", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.7097486854, green: 0.7098352313, blue: 0.7097191215, alpha: 1), for: .normal)
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.backgroundColor = #colorLiteral(red: 0.9951116443, green: 1, blue: 0.9956502318, alpha: 1)
    //    $0.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
  }
  let csTextLabel = UILabel().then {
    $0.attributedText = NSMutableAttributedString().normal("고객센터 ", fontSize: 12).bold("02-1899-6840", fontSize: 13)
    $0.textColor = .gray
  }
  let businessHoursLabel = UILabel().then {
    $0.text = "평일 10:00~18:00 (토, 일요일, 공휴일 휴무)"
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = UIColor(named: "TextFieldColor")
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      completeButton,
      csTextLabel,
      businessHoursLabel
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    completeButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
    }
    csTextLabel.snp.makeConstraints {
      $0.top.equalTo(completeButton.snp.bottom).offset(40)
      $0.centerX.equalToSuperview()
    }
    businessHoursLabel.snp.makeConstraints {
      $0.top.equalTo(csTextLabel.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-16)
    }
    
  }
}
