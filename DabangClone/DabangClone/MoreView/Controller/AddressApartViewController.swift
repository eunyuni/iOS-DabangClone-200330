//
//  AddressApartViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 아파트 주소검색 - 정덕
class AddressApartViewController: UIViewController {
  // MARK: - Property
  
  private let addressApartView = AddressApartView()
  
  // MARK: - AppLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    setupUI()
  }
  // MARK: - SetupUI
  private func setupUI() {
    self.view.addSubviews([addressApartView])
    setupConstraint()
    
  }
  
  // MARK: - AutoLayout
  private func setupConstraint() {
    addressApartView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(30)
      $0.bottom.leading.trailing.equalToSuperview()
    }
//    let duck = AddressViewController()
//    //    duck.modalPresentationStyle =
//        duck.view.alpha = 0.4
//        duck.view.backgroundColor = .black
//        present(duck,animated: true)
  }
  // MARK: - Action
  // MARK: - SetupUI

}
