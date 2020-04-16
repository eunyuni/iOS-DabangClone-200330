//
//  OptionCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/03/31.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 방내농기 추가정보 옵션 저장
class OptionCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "OptionCollectionViewCell"
  // MARK: - Property
  private let titleLabel = UILabel()
  private let tapGesture = UITapGestureRecognizer()
  private var isactive = true
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue(title: String) {
    self.titleLabel.text = title
  }
  
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer) {
    if isactive {
      self.titleLabel.textColor = .white
      self.contentView.backgroundColor = .blue
    } else {
      self.titleLabel.textColor = .black
      self.contentView.backgroundColor = .white
    }
    isactive.toggle()
  }
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([titleLabel])
    tapGesture.addTarget(self, action: #selector(didTapGesture(_:)))
    self.contentView.layer.borderWidth = 0.6
    self.contentView.layer.borderColor = UIColor.lightGray.cgColor
    self.contentView.layer.cornerRadius = 23
    self.addGestureRecognizer(tapGesture)
    setupConstraint()
  }
  // 스퀘드 체제
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
