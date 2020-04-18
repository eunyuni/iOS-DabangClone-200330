//
//  SaleAreaCollectionViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 분양모두보기 검색 셀
class SaleAreaCollectionViewCell: UICollectionViewCell {
  // MARK: - Identifier
  static let identifier = "SaleAreaCollectionViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
  }
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
      self.contentView.backgroundColor = .white
      self.contentView.layer.borderColor = UIColor.black.cgColor
      self.contentView.layer.borderWidth = 0.6
    } else {
      self.contentView.backgroundColor = UIColor(named: "TextFieldColor")
      self.contentView.layer.borderColor = UIColor.lightGray.cgColor
      self.contentView.layer.borderWidth = 0.2
    }
    isactive.toggle()
  }
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([titleLabel])
    tapGesture.addTarget(self, action: #selector(didTapGesture(_:)))
    self.contentView.layer.borderWidth = 0.2
    self.contentView.layer.borderColor = UIColor.lightGray.cgColor
    self.contentView.backgroundColor = UIColor(named: "TextFieldColor")
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
