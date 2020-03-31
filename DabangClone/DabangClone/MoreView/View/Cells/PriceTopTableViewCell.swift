//
//  PriceTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class PriceTopTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "PriceTopTableViewCell"
  
  // MARK: -Property
  
  let priceLabel = UILabel().then {
//    $0.text = "가격을 입력하세요"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
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
  
  func configue(title: String) {
    priceLabel.text = title
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      priceLabel,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    priceLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(16)
      $0.bottom.equalTo(-16)
    }
    
  }
  

}
