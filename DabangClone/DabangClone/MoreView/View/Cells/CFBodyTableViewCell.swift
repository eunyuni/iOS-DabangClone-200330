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
  private let buttonLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.text = "↓"
  }
  private let textField = UITextField().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
    $0.placeholder = "선택하세요"
    $0.addLeftPadding(20)
  }

  private lazy var pickerView = UIPickerView().then {
    $0.backgroundColor = .white
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
    pickerView.delegate = self
    pickerView.dataSource = self
    
    contentView.addSubviews([
    
    titleLabel,
    textField,
    
    ])
    
    textField.addSubview(buttonLabel)
    
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
      $0.bottom.equalToSuperview().offset(-20)
    }
    buttonLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-12)
      $0.centerY.equalToSuperview()
    }
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
    return floorsData[row]
  }

  // 피커뷰 선택시
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print("row: \(row)")
    print("value: \(floorsData[row])")
    textField.text = floorsData[row]
  }


}


// MARK: -UITextFieldDelegate
// 키보드 터치, 내려가도록
extension CFBodyTableViewCell: UITextFieldDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.endEditing(true)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
