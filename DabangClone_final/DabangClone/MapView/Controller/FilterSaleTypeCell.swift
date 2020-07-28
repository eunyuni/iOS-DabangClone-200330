//
//  SaleTypeCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterSaleTypeSingleton {
  static let shared = FilterSaleTypeSingleton()
  
  var 월세: Bool = true
  var 전세: Bool = true
  var 매매: Bool = false
}

class FilterSaleTypeCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "FilterSaleTypeCell"
  
  var selectedButtonArr: [UIButton] = []
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.text = "매물종류"
    $0.font = .systemFont(ofSize: 13, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "중복선택 가능합니다."
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .gray
  }
  private lazy var monthlyButton = UIButton().then {
    $0.tag = 0
    $0.setTitle("월세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterSaleTypeSingleton.shared.월세
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  private lazy var charterButton = UIButton().then {
    $0.tag = 1
    $0.setTitle("전세", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterSaleTypeSingleton.shared.전세
    $0.addTarget(self, action: #selector(selectedFilteringButton(_:)), for: .touchUpInside)
  }
  private lazy var tradingButton = UIButton().then {
    $0.tag = 2
    $0.setTitle("매매", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = UIColor(named: "LightGrayColor")
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.isSelected = FilterSaleTypeSingleton.shared.매매
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
      subTitleLabel,
      monthlyButton,
      charterButton,
      tradingButton,
      
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
      $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
    }
    monthlyButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(titleLabel)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom)
      $0.width.equalTo(40)
      $0.height.equalTo(32)
    }
    charterButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(monthlyButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(40)
      $0.height.equalTo(monthlyButton)
    }
    tradingButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
      $0.leading.equalTo(charterButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(40)
      $0.height.equalTo(monthlyButton)
    }
  }
  
  func setButtonSelectedStatus() {
    print("setButtonSelectedStatus is run")
    let AllButtons: [UIButton] = [monthlyButton, charterButton, tradingButton]
    AllButtons.forEach { initButtonsColor($0) }
    
  }
  
  func updateSelectedButton() {
    let AllButtons: [UIButton] = [monthlyButton, charterButton, tradingButton]
    selectedButtonArr = AllButtons.filter{ $0.isSelected == true }
    
    TemporaryFilterSaleTypeSingleton.shared.saleType = selectedButtonArr
  }
  
  @objc private func selectedFilteringButton(_ sender: UIButton) {
    
    self.updateSelectedButton()
    
      if sender.isSelected == false {
        sender.backgroundColor = UIColor(named: "DabangLightBlue")
        sender.setTitleColor(.white, for: .normal)
        sender.layer.borderWidth = 0
        sender.layer.borderColor = UIColor.clear.cgColor
        sender.isSelected = true
      } else {
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
