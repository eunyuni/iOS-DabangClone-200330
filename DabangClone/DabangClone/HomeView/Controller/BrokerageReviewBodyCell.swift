//
//  BrokerageReviewBodyCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BrokerageReviewBodyCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "BrokerageReviewBodyCell"
  
  // MARK: -Property
  private let titleLable = UILabel().then {
    $0.font = .systemFont(ofSize: 15, weight: .regular)
    $0.textColor = .gray
    $0.text = "아직 작성된 리뷰가 없습니다."
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
  
  func configue() {
    
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      titleLable,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    titleLable.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(70)
      $0.centerX.equalToSuperview()
    }
  }
  
}
