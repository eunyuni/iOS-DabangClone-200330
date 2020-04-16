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
  private let titleLabel = UILabel().then {
    $0.text = "층수"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  private let frameView = UIView()
  private let allButton = UIButton().then {
    $0.setTitle("전체", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.maskedCorners = [.layerMinXMinYCorner]
    $0.layer.cornerRadius = 4
  }
  private let floor1 = UIButton().then {
    $0.setTitle("1층", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
  }
  private let floor2 = UIButton().then {
    $0.setTitle("2층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let floor3 = UIButton().then {
    $0.setTitle("3층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let floor4 = UIButton().then {
    $0.setTitle("4층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.maskedCorners = [.layerMaxXMinYCorner]
    $0.layer.cornerRadius = 4
  }
  private let floor5 = UIButton().then {
    $0.setTitle("5층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.maskedCorners = [.layerMinXMaxYCorner]
    $0.layer.cornerRadius = 4
  }
  private let floor6 = UIButton().then {
    $0.setTitle("6층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let floor7 = UIButton().then {
    $0.setTitle("7층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let undergroundButton = UIButton().then {
    $0.setTitle("반지층", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let rooftopButton = UIButton().then {
    $0.setTitle("옥탑방", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.maskedCorners = [.layerMaxXMaxYCorner]
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
      subTitleLabel,
      frameView,
    ])
    
    frameView.addSubviews([
      allButton,
      floor1,
      floor2,
      floor3,
      floor4,
      floor5,
      floor6,
      floor7,
      undergroundButton,
      rooftopButton,
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
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(64)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
    }
    allButton.snp.makeConstraints {
      $0.top.leading.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.2)
      $0.height.equalToSuperview().multipliedBy(0.5)
    }
    floor1.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(allButton.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor2.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(floor1.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor3.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(floor2.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor4.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(floor3.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor5.snp.makeConstraints {
      $0.top.equalTo(allButton.snp.bottom)
      $0.leading.equalToSuperview()
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor6.snp.makeConstraints {
      $0.top.equalTo(floor5)
      $0.leading.equalTo(floor5.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    floor7.snp.makeConstraints {
      $0.top.equalTo(floor5)
      $0.leading.equalTo(floor6.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    undergroundButton.snp.makeConstraints {
      $0.top.equalTo(floor5)
      $0.leading.equalTo(floor7.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
    rooftopButton.snp.makeConstraints {
      $0.top.equalTo(floor5)
      $0.leading.equalTo(undergroundButton.snp.trailing)
      $0.width.equalTo(allButton)
      $0.height.equalTo(allButton)
    }
  }
  
}
