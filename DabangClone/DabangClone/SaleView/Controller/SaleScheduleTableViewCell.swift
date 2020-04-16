//
//  SaleScheduleTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 분양 일정 셀
class SaleScheduleTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "SaleScheduleTableViewCell"
  // MARK: - Property
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
  }
}
