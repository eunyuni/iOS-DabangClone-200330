//
//  SaveView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/30.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaveView: UIView {
  
  // MARK: -Property
  let saveLabel = UIButton().then {
    $0.setTitle("저장", for: .normal)
    $0.setTitleColor(UIColor(named: "SaveTextColor"), for: .normal)
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
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubview(saveLabel)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    saveLabel.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
  

}
