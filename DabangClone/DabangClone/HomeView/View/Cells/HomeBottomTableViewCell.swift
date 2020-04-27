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
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.5332907438, green: 0.5333573818, blue: 0.5332680941, alpha: 1)
  }
  private let bottomLabel = UILabel().then {
    $0.text = "v 3.7.0(3.7.20030601)"
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.5332907438, green: 0.5333573818, blue: 0.5332680941, alpha: 1)
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
    self.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
    self.addSubviews([topLabel, bottomLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    topLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(20)
    }
    bottomLabel.snp.makeConstraints {
      $0.top.equalTo(topLabel.snp.bottom).offset(4)
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-30)
    }
  }

}
