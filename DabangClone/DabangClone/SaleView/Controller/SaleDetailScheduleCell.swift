//
//  SaleScheduleCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
protocol SaleDetailScheduleCellDelegate: class {
  func didTapButton()
}
// 분양상세화면 → 분양일정
class SaleDetailScheduleCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "SaleDetailScheduleCell"
  
  // MARK: -Property
  weak var delegate : SaleDetailScheduleCellDelegate?
  
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .bold)
    $0.textColor = .black
    $0.text = "분양 일정"
  }
  let subTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
    $0.text = "! 분양 일정은 건설사 사정에 따라 변경될 수 있습니다"
  }
  let lineView1 = UIView().then {
    $0.backgroundColor = .lightGray
    $0.alpha = 0.5
  }
  let saleScheduleDate = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .regular)
    $0.textColor = .black
    $0.text = "20년 상반기"
  }
  let saleSchedule = UILabel().then {
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
    $0.text = "모집공고"
  }
  let saleScheduleDday = UILabel().then {
    $0.font = .systemFont(ofSize: 13, weight: .bold)
    $0.textColor = .lightGray
    $0.text = "예정"
  }
  let lineView2 = UIView().then {
    $0.backgroundColor = .lightGray
    $0.alpha = 0.5
  }
  let alarmButton = UIButton().then {
    $0.setTitle("일정 알림 받기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
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
  
  func configue() {
    
  }
  
  @objc private func didTapButton(_ sender: UIButton) {
    delegate?.didTapButton()
  }
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      titleLabel,
      subTitleLabel,
      lineView1,
      saleScheduleDate,
      saleSchedule,
      saleScheduleDday,
      lineView2,
      alarmButton,
    ])
    alarmButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(26)
      $0.leading.equalToSuperview().offset(26)
    }
    subTitleLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel)
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
    }
    lineView1.snp.makeConstraints {
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview()
//      $0.width.equalTo(20)
      $0.height.equalTo(0.5)
//      $0.height.equalTo(20)
    }
    saleScheduleDate.snp.makeConstraints {
      $0.top.equalTo(lineView1.snp.bottom).offset(16)
      $0.leading.equalToSuperview().offset(26)
    }
    saleSchedule.snp.makeConstraints {
      $0.top.equalTo(saleScheduleDate)
      $0.leading.equalTo(saleScheduleDate.snp.trailing).offset(40)
    }
    saleScheduleDday.snp.makeConstraints {
      $0.top.equalTo(saleScheduleDate)
      $0.trailing.equalToSuperview().inset(26)
    }
    lineView2.snp.makeConstraints {
      $0.top.equalTo(saleScheduleDday.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(0.5)
    }
    alarmButton.snp.makeConstraints {
      $0.top.equalTo(lineView2.snp.bottom).offset(1)
      $0.width.equalToSuperview()
      $0.height.equalTo(50)
      $0.bottom.equalToSuperview()
    }
    
    
    
    
  }
  

}
