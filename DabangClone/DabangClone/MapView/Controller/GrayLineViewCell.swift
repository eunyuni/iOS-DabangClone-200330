//
//  GrayLineViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class GrayLineViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "GrayLineViewCell"
  
  // MARK: -Property
  private let grayLine = UIView().then {
    $0.backgroundColor = .gray
    $0.alpha = 0.4
  }
  private let bottomGrayView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
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
      grayLine,
      bottomGrayView,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    grayLine.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    bottomGrayView.snp.makeConstraints {
      $0.top.equalTo(grayLine.snp.bottom)
      $0.width.equalToSuperview()
      $0.height.equalTo(6)
      $0.bottom.equalToSuperview()
    }
    
  }
  
  
}
