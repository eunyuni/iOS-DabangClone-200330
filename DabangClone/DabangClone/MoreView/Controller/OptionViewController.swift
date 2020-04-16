//
//  OptionViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 방내농기 추가정보 옵션 저장
class OptionViewController: UIViewController {
  // MARK: - Property
  private let optionView = OptionView()
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    self.view.addSubviews([optionView ])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    optionView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(40)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
}
