//
//  FilterFloorCountCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterFloorCountCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterFloorCountCell"
  
  
  // MARK: -Property
  let titleLabel = UILabel().then {
    $0.text = "층수"
    $0.font = .systemFont(ofSize: 13, weight: .regular)
  }
  let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  let floorView = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let allButton = UIButton().then {
    $0.setTitle("월세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  let floor1 = UIButton().then {
    $0.setTitle("전세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  let floor2 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let floor3 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let floor4 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let floor5 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let floor6 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let floor7 = UIButton().then {
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let undergroundButton = UIButton().then {
    $0.setTitle("반지층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  let rooftopButton = UIButton().then {
    $0.setTitle("옥탑방", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
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
//      subTitleLabel,
//      floorView,
    ])
    
//    floorView.addSubviews([
//      allButton,
//      floor1,
//      floor2,
//      floor3,
//      floor4,
//      floor5,
//      floor6,
//      floor7,
//      undergroundButton,
//      rooftopButton,
//    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Padding.topBottom)
      $0.leading.equalToSuperview().offset(16)
    }
//    subTitleLabel.snp.makeConstraints {
//      $0.top.equalTo(titleLabel)
//      $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
//    }
//    floorView.snp.makeConstraints {
//      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
//      $0.centerX.equalToSuperview()
//      $0.width.equalToSuperview().multipliedBy(0.9)
//      $0.height.equalTo(64)
//      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
//    }
//    allButton.snp.makeConstraints {
//      $0.top.leading.equalToSuperview()
//      $0.width.equalToSuperview().multipliedBy(0.2)
//      $0.height.equalTo(32)
//    }
//    floor1.snp.makeConstraints {
//      $0.top.equalToSuperview()
//      $0.leading.equalTo(allButton.snp.trailing)
//      $0.width.equalTo(allButton)
//      $0.height.equalTo(allButton)
//    }
//    floor2.snp.makeConstraints {
//      $0.top.equalToSuperview()
//      $0.leading.equalTo(floor1.snp.trailing)
//      $0.width.equalTo(allButton)
//      $0.height.equalTo(allButton)
//    }
//    floor3.snp.makeConstraints {
//      $0.top.equalToSuperview()
//      $0.leading.equalTo(floor2.snp.trailing)
//      $0.width.equalTo(allButton)
//      $0.height.equalTo(allButton)
//    }
//    floor4.snp.makeConstraints {
//      $0.top.equalToSuperview()
//      $0.leading.equalTo(floor3.snp.trailing)
//      $0.width.equalTo(allButton)
//      $0.height.equalTo(allButton)
//    }
//
  }
  
}
