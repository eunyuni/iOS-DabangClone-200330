//
//  CFTopTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CFTopTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "CFTopTableViewCell"
  
  // MARK: -Property
  private let label = UILabel().then {
    $0.text = "해당 층 수와 건물 층 수를 입력하세요"
    $0.font = .systemFont(ofSize: 16, weight: .regular)
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubviews([
      label,
    ])
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    label.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(16)
      $0.bottom.equalTo(-16)
    }
  }
}
