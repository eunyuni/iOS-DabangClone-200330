//
//  CFBodyTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CFBodyTableViewCell: UITableViewCell {
  
  enum CFBodyCellPickerType {
    case 해당층수
    case 건물층수
    case 문의
  }
  
  // MARK: -Identifier
  static let identifier = "CFBodyTableViewCell"
  
  private var cellType: CFBodyCellPickerType = .해당층수
  
  // MARK: -Property
  private let 해당층수 = ["반지층", "옥탑", "1층", "2층", "3층", "4층", "5층", "6층", "7층", "8층", "9층", "10층"]
  private let 건물층수 = ["1층", "2층", "3층", "4층", "5층", "6층", "7층", "8층", "9층", "10층"]
  private let 문의 = ["일반문의", "허위매물신고"]
  
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
  private let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil)
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue(category: String, pickerType: CFBodyCellPickerType) {
    cellType = pickerType
    titleLabel.text = category
    pickerView.reloadAllComponents()
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
    
    toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton]
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
    switch cellType {
    case .해당층수:
      return 해당층수.count
    case .건물층수:
      return 건물층수.count
    case .문의:
      return 문의.count
    }
  }
  
  // 피커뷰 데이터 제목
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch cellType {
    case .해당층수:
      return 해당층수[row]
    case .건물층수:
      return 건물층수[row]
    case .문의:
      return 문의[row]
    }
  }
  
  // 피커뷰 선택시
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print("row: \(row)")
    switch cellType {
    case .해당층수:
      return textField.text = 해당층수[row]
    case .건물층수:
      return textField.text = 건물층수[row]
    case .문의:
      return textField.text = 문의[row]
    }
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
