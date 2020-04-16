//
//  FindTitleCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FindTitleCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "FindTitleCell"
  
  // MARK: -Property
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .bold)
    $0.textColor = .black
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
   
  func configue(titleLabel: String) {
    self.titleLabel.text = titleLabel
   }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubview(titleLabel)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().inset(16)
      $0.bottom.equalToSuperview().inset(6)
    }
    
  }
  

}
