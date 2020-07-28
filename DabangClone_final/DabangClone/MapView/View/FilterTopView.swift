//
//  FilterTopView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/27.
//  Copyright © 2020 pandaman. All rights reserved.
//



import UIKit

protocol FilterTopViewDelegate: class {
  func didTapButton()
}

class FilterTopView: UIView {
  
  // MARK: -Property
  weak var delegate: FilterTopViewDelegate?
  
  private let grayLineView = UIView().then {
    $0.backgroundColor = .gray
  }
  private let cancelButton = UIButton().then {
    $0.setImage(UIImage(named: "cancelButton"), for: .normal)
  }
  private let initButton = UIButton().then {
    $0.setTitle("초기화", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .light)
    $0.setTitleColor(.black, for: .normal)
  }
  private let titleLabel = UILabel().then {
    $0.text = "맞춤필터"
    $0.font = .systemFont(ofSize: 18, weight: .bold)
  }
  private let bottomLine = UIView().then {
    $0.backgroundColor = .gray
  }
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue() {
    
  }
  
  @objc func didTapCancelButton() {
    delegate?.didTapButton()
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.backgroundColor = UIColor(named: "LightGrayColor")
    self.addSubviews([
      cancelButton,
      titleLabel,
      initButton,
      bottomLine,
      
    ])
    cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    cancelButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(14)
      $0.leading.equalToSuperview().inset(12)
    }
    titleLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(14)
      $0.centerX.equalToSuperview()
    }
    initButton.snp.makeConstraints {
      $0.centerY.equalTo(titleLabel)
      $0.trailing.equalToSuperview().inset(12)
    }
    bottomLine.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.height.equalTo(0.2)
      $0.width.equalToSuperview()
    }
  }
  

}
