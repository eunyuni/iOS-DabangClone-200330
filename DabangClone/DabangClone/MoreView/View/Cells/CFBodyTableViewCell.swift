//
//  CFBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CFBodyTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "CFBodyTableViewCell"
  
  // MARK: -Property
  private let floorsData = ["반지층", "옥탑", "1층", "2층", "3층", "4층", "5층", "6층", "7층", "8층", "9층", "10층"]
  
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 17, weight: .regular)
  }
  private let toolbar = UIToolbar()
  private let textField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
//    $0.placeholder = "0"
//    $0.inputAccessoryView = tool
//    $0.type
    $0.addLeftPadding(20)
  }
//  private lazy var imagePickerController: UIImagePickerController = {
//    let picker = UIImagePickerController()
////    picker.delegate = self
//    picker.allowsEditing = true
//    return picker
//  }()
  private lazy var pickerView = UIPickerView().then {
    $0.backgroundColor = .white
//    $0.
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
    pickerView.delegate = self
    pickerView.dataSource = self
    
    contentView.addSubviews([
    
    titleLabel,
    textField,
//    pickerView,
    
    ])
    toolbar.sizeToFit()
    textField.inputAccessoryView = toolbar
    textField.inputView = pickerView
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
//    pickerView.snp.makeConstraints {
//      $0.top.equalTo(textField).offset(12)
//      $0.centerX.equalToSuperview()
//      $0.width.equalToSuperview().multipliedBy(0.9)
//      $0.height.equalTo(50)
//      $0.bottom.equalToSuperview().offset(-10)
//    }
  }


}


// MARK: UIPicker

extension CFBodyTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
  
  // 피커뷰 칼럼 수
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  // 데이터 행의 개수
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    floorsData.count
  }

  // 피커뷰 데이터 제목
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    floorsData[row]
  }

  // 피커뷰 선택시
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print("row: \(row)")
    print("value: \(floorsData[row])")
    textField.text = floorsData[row]
  }


}


