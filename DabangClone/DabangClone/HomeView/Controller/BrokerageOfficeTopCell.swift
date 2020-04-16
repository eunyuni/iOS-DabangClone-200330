//
//  RealPropertyTopCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 중개사무소 프로필화면(헤더부분)
class BrokerageOfficeTopCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "BrokerageOfficeTopCell"
  
  // MARK: -Property
  let profileImage = UIImageView().then {
    $0.image = UIImage(named: "profileImage")
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
    contentView.backgroundColor = UIColor(named: "ProfileBackgroundColor")
    contentView.addSubviews([
      profileImage,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    profileImage.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(50)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.169)
      $0.height.equalTo(self.snp.width).multipliedBy(0.169)
      
    }
  }
  
  
}
