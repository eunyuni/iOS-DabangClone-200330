//
//  SaleNewsDetailTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/14.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SaleNewsDetailTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  static let identifier = "SaleNewsDetailTableViewCell"
  // MARK: - Property
  private let newsTypeLabel = UILabel().then {
    $0.text = "정책"
    $0.font = .boldSystemFont(ofSize: 15)
    $0.textColor = #colorLiteral(red: 0.1764538288, green: 0.1764799953, blue: 0.1764449179, alpha: 1)
  }
  private let newsTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = #colorLiteral(red: 0.2666433454, green: 0.2666797638, blue: 0.2666309774, alpha: 1)
    $0.numberOfLines = 0
  }
  private let newsDetailLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.6666144729, green: 0.6666962504, blue: 0.6665866375, alpha: 1)
  }
  private let newsImageView = UIImageView().then {
    $0.layer.cornerRadius = 5
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.clipsToBounds = true
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
  func configue(_ news: NewsTheme) {
    newsTypeLabel.text = news.typeLabel
    newsTitleLabel.text = news.titleLabel
    newsDetailLabel.text = news.DetailLabel
    newsImageView.image = news.Image
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([newsTypeLabel, newsTitleLabel, newsDetailLabel, newsImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    newsTypeLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.leading.equalToSuperview().offset(15)
      $0.width.equalTo(28)
    }
    
    newsTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.leading.equalTo(newsTypeLabel.snp.trailing).offset(8)
      $0.trailing.equalTo(newsImageView.snp.leading).offset(-26)
    }
    newsDetailLabel.snp.makeConstraints {
      $0.top.equalTo(newsTitleLabel.snp.bottom).offset(6)
      $0.leading.equalTo(newsTitleLabel.snp.leading)
    }
    newsImageView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(12)
      $0.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(74)
      $0.width.equalTo(114)
      $0.bottom.equalToSuperview().inset(12)
    }
  }
}


