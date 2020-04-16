//
//  AddressSelectViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
// 아파트 주소찾기 시/도/동 정덕
class AddressSelectViewController: UIViewController {

    // MARK: - Property
    private let addressSelectView = AddressSelectView()
    private let duck = UIView()
    // MARK: - Lift cycle
    override func viewDidLoad() {
      super.viewDidLoad()
      setupUI()
    }
    
    // MARK: - Action
    
    // MARK: - setupUI
    private func setupUI() {
  //    duck.backgroundColor = .red
      self.view.addSubviews([addressSelectView ])
      setupConstraint()
    }
    
    // MARK: - setupConstraint
    private func setupConstraint() {
      addressSelectView.snp.makeConstraints {
        $0.top.equalToSuperview().offset(40)
        $0.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
