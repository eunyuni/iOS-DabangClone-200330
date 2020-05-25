//
//  FilterRoomTypeCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterRoomTypeSingleton {
  static let shared = FilterRoomTypeSingleton()
  
  var 원룸: Bool = true
  var 투쓰리룸: Bool = true
  var 오피스텔: Bool = true
  var 아파트: Bool = false
}

class FilterRoomTypeCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterRoomTypeCell"
  var selectedButtonArr: [UIButton] = []
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "방 종류"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  lazy var oneRoomButton = UIButton() .then {
    $0.tag = 0
    $0.setTitle("원룸", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterRoomTypeSingleton.shared.원룸
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  lazy var twoRoomButton = UIButton().then {
    $0.tag = 1
    $0.setTitle("투∙쓰리룸", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterRoomTypeSingleton.shared.투쓰리룸
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  lazy var officetelButton = UIButton().then {
    $0.tag = 2
    $0.setTitle("오피스텔", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterRoomTypeSingleton.shared.오피스텔
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  lazy var apartButton = UIButton().then {
    $0.tag = 3
    $0.setTitle("아파트", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterRoomTypeSingleton.shared.아파트
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setButtonSelectedStatus()
    updateSelectedButton()
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    contentView.addSubviews([
      titleLabel,
      oneRoomButton,
      twoRoomButton,
      officetelButton,
      apartButton,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(Padding.topBottom)
      $0.leading.equalToSuperview().offset(16)
    }
    oneRoomButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
      $0.width.equalTo(40)
      $0.height.equalTo(32)
    }
    twoRoomButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(oneRoomButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(70)
      $0.height.equalTo(oneRoomButton)
    }
    officetelButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(twoRoomButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(64)
      $0.height.equalTo(oneRoomButton)
    }
    apartButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(officetelButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(54)
      $0.height.equalTo(oneRoomButton)
    }
  }
  
  func setButtonSelectedStatus() {
    print("setButtonSelectedStatus is run")
    let AllButtons: [UIButton] = [oneRoomButton, twoRoomButton, officetelButton, apartButton]
    AllButtons.forEach { initButtonsColor($0) }
  }
  
  func updateSelectedButton() {
    let AllButtons: [UIButton] = [oneRoomButton, twoRoomButton, officetelButton, apartButton]
    selectedButtonArr = AllButtons.filter{ $0.isSelected == true }
    
    TemporaryFilterSingleton.shared.roomType = selectedButtonArr
      
  }
  
  @objc private func selectedFilteringButton(_ sender: UIButton) {
    print("selectedFilteringButton function is run")
    self.updateSelectedButton()
    
    if selectedButtonArr.isEmpty && sender == apartButton && sender.isSelected == false {
      sender.backgroundColor = UIColor(named: "DabangLightBlue")
      sender.setTitleColor(.white, for: .normal)
      sender.layer.borderWidth = 0
      sender.layer.borderColor = UIColor.clear.cgColor
      sender.isSelected = true
    } else if sender == apartButton && sender.isSelected == true {
      sender.backgroundColor = UIColor(named: "LightGrayColor")
      sender.setTitleColor(.black, for: .normal)
      sender.layer.borderWidth = 0.6
      sender.layer.borderColor = UIColor.lightGray.cgColor
      sender.isSelected = false
    } else if selectedButtonArr.filter({ $0 == apartButton }).isEmpty && sender.isSelected == false && sender != apartButton {
      sender.backgroundColor = UIColor(named: "DabangLightBlue")
      sender.setTitleColor(.white, for: .normal)
      sender.layer.borderWidth = 0
      sender.layer.borderColor = UIColor.clear.cgColor
      sender.isSelected = true
    } else if sender != apartButton {
      sender.backgroundColor = UIColor(named: "LightGrayColor")
      sender.setTitleColor(.black, for: .normal)
      sender.layer.borderWidth = 0.6
      sender.layer.borderColor = UIColor.lightGray.cgColor
      sender.isSelected = false
    }
    self.updateSelectedButton()
    
  }
  
  private func initButtonsColor(_ sender: UIButton) {
    if sender.isSelected == true {
      sender.backgroundColor = UIColor(named: "DabangLightBlue")
      sender.setTitleColor(.white, for: .normal)
      sender.layer.borderWidth = 0
      sender.layer.borderColor = UIColor.clear.cgColor
    } else {
      sender.backgroundColor = UIColor(named: "LightGrayColor")
      sender.setTitleColor(.black, for: .normal)
      sender.layer.borderWidth = 0.6
      sender.layer.borderColor = UIColor.lightGray.cgColor
    }
  }
}
