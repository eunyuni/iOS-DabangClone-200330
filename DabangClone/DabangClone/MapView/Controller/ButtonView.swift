//
//  ButtonView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/05.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ButtonView: UIView {
  
  // MARK: -Property
  private let button = UIButton().then {
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.backgroundColor = .clear
  }
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor(named: "SaveButtonColor")
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
   
  func configue(buttonLabel: String) {
    self.button.setTitle(buttonLabel, for: .normal)
   }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubview(button)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    button.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
  
  
  
}
