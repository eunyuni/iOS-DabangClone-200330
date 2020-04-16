//
//  FindRoomConditionCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FindRoomConditionCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "FindRoomConditionCell"
  
  // MARK: -Property
  private let button = UIButton().then {
//    $0.setTitle("서울대학교", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
    $0.backgroundColor = .white
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
  
  // MARK: -Action
  
  func configue(buttonLabel: String) {
    self.button.setTitle(buttonLabel, for: .normal)
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubview(button)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    button.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(6)
      $0.height.equalTo(40)
      $0.width.equalToSuperview().multipliedBy(0.92)
      $0.centerX.equalToSuperview()
    }
    
  }
  

}
