//
//  SearchView.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/05.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 홈 메인 검색누르는 뷰
protocol SearchViewDelegate: class {
  func didTapPresent()
}

class SearchView: UIView {
  // MARK: - Property
  weak var delegate: SearchViewDelegate?
  private let view = UIView().then {
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.blue.cgColor
    $0.layer.cornerRadius = 2
  }
  private let searchLabel = UILabel().then {
    $0.text = "어반빌리움 수유"
    $0.textColor = .blue
    $0.font = .systemFont(ofSize: 17)
  }
  private let searchImageView = UIImageView().then {
    $0.image = UIImage(named: "searchIcon")
  }
  
  private let tapGesture = UITapGestureRecognizer()
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer) {
    print("didTapGesture")
    delegate?.didTapPresent()
  }
  // MARK: - setupUI
  private func setupUI() {
    self.backgroundColor = .white
    self.addSubviews([view])
    view.addSubviews([searchLabel,searchImageView])
    view.addGestureRecognizer(tapGesture)
    tapGesture.addTarget(self, action: #selector(didTapGesture(_:)))
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    view.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview().inset(20)
    }
    searchLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(12)
    }
    searchImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-12)
      $0.height.width.equalTo(18)
    }
  }

}
