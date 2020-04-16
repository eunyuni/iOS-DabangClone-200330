//
//  HomeBottomTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/05.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 페이지
class HomeBottomTableViewCell: UITableViewCell {

  // MARK: - Identifier
  static let identifier = "HomeBottomTableViewCell"
  // MARK: - Property
  private let topLabel = UILabel().then {
    $0.text = "Made with soul by Station3 Inc."
  }
  private let bottomLabel = UILabel().then {
    $0.text = "v 3.7.0(3.7.20030601)"
  }
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
