//
//  FindBottomView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FindBottomView: UIView {
  
  // MARK: -Property
  
  private let commentLabel = UILabel().then {
    $0.text = """
    ∙ 더 상세한 조건은 맞춤필터에서 제공됩니다.
    ∙ 조건 미선택 시 기존에 설정한 맞춤필터가 유지됩니다.
    """
    $0.numberOfLines = 2
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.textColor = .gray
  }
  private let button = ButtonView()
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.backgroundColor = .white
    button.configue(buttonLabel: "방 찾기", fontSize: CGFloat(18))
    self.addSubviews([
      commentLabel,
      button,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    commentLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(16)
      $0.leading.equalToSuperview().inset(12)
    }
    button.snp.makeConstraints {
      $0.top.equalTo(commentLabel.snp.bottom).offset(30)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    
  }
  
  
}
