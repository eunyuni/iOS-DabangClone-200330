////
////  AddressViewController.swift
////  DabangClone
////
////  Created by 황정덕 on 2020/03/30.
////  Copyright © 2020 pandaman. All rights reserved.
////
//
//import UIKit
//import WebKit
//import SnapKit
//import Then
//class AddressViewController: UIViewController {
//  // MARK: - Property
//  private let addressView = AddressView()
//  // MARK: - AppLifeCycle
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    self.view.backgroundColor = .white
//
//  }
//  override func viewSafeAreaInsetsDidChange() {
//    super.viewSafeAreaInsetsDidChange()
//    setupUI()
//  }
//  // MARK: - Action
//  // MARK: - SetupUI
//  private func setupUI() {
//    self.view.addSubview(addressView)
//    setupConstraint()
//  }
//
//  // MARK: - Layout
//  private func setupConstraint() {
//    let guide = self.view.safeAreaLayoutGuide
//    addressView.snp.makeConstraints {
//      $0.top.leading.bottom.trailing.equalTo(guide)
//    }
//  }
//}
//// MARK: - Identifier
//// MARK: - Property
//// MARK: - Init
//// MARK: - Life Cycle
//// MARK: - Action
//// MARK: - SetupUI
//// MARK: - Layout
