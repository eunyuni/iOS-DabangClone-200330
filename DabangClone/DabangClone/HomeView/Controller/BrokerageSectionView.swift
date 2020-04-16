//
//  BrokerageSectionView.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

protocol BrokerageSectionViewDelegate: class {
  func didTap(sender: UIButton)
}

class BrokerageSectionView: UIView {
  
  weak var delegate: BrokerageSectionViewDelegate?
  
  // MARK: -Property
  let homeButton = UIButton().then {
    $0.setTitle("홈", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.addTarget(self, action: #selector(didTapHomeButton(_:)), for: .touchUpInside)
    $0.tag = 0
  }
  let selectionLine = UIView().then {
    $0.backgroundColor = .black
  }
  let roomButton = UIButton().then {
    $0.setTitle("방(10)", for: .normal)
    $0.setTitleColor(.lightGray, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.addTarget(self, action: #selector(didTapHomeButton(_:)), for: .touchUpInside)
    $0.tag = 1
  }
  let reviewButton = UIButton().then {
    $0.setTitle("리뷰(0)", for: .normal)
    $0.setTitleColor(.lightGray, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.addTarget(self, action: #selector(didTapHomeButton(_:)), for: .touchUpInside)
    $0.tag = 2
  }
  
  
  // MARK: -init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setupUI()
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  
  
  func configue() {
    
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    self.addSubviews([
    homeButton,
    roomButton,
    reviewButton,
    selectionLine,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    let mainWidth = UIScreen.main.bounds.width
//    var selectionLeading: NSLayoutConstraint?
    homeButton.snp.makeConstraints {
      $0.top.leading.equalToSuperview()
      $0.width.equalTo(mainWidth / 3)
      $0.height.equalTo(50)
    }
    roomButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(homeButton.snp.trailing)
      $0.width.height.equalTo(homeButton)
    }
    reviewButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalTo(roomButton.snp.trailing)
      $0.width.height.equalTo(homeButton)
    }
    selectionLine.snp.makeConstraints {
      $0.width.equalTo(mainWidth / 3)
      $0.height.equalTo(2)
      $0.leading.equalToSuperview()
      $0.top.equalTo(homeButton.snp.bottom)
    }
//    selectionLeading = selectionLine.leadingAnchor.constraint(equalTo: self.leadingAnchor)
  }
  
  @objc private func didTapHomeButton(_ sender: UIButton) {
    delegate?.didTap(sender: sender)
    
    
    
//    let mainWidth = UIScreen.main.bounds.width
    UIView.animate(withDuration: 0.2) {
      
//      [self.homeButton, self.roomButton, self.reviewButton].forEach {
//        if $0.tag == sender.tag {
//          $0.setTitleColor(.black, for: .normal)
//        } else {
//          $0.setTitleColor(.lightGray, for: .normal)
//        }
//      }
      
      if sender.tag == 0 {
        self.selectionLine.transform = .init(translationX: self.frame.minX - self.selectionLine.bounds.minX, y: 0)
        self.homeButton.setTitleColor(.black, for: .normal)
        self.roomButton.setTitleColor(.lightGray, for: .normal)
        self.reviewButton.setTitleColor(.lightGray, for: .normal)
      } else if sender.tag == 1 {
        self.selectionLine.transform = .init(translationX: self.frame.maxX / 3 - self.selectionLine.bounds.minX, y: 0)
        self.homeButton.setTitleColor(.lightGray, for: .normal)
        self.roomButton.setTitleColor(.black, for: .normal)
        self.reviewButton.setTitleColor(.lightGray, for: .normal)
      } else if sender.tag == 2 {
        self.selectionLine.transform = .init(translationX: self.frame.maxX / 3 * 2 - self.selectionLine.bounds.minX, y: 0)
        self.homeButton.setTitleColor(.lightGray, for: .normal)
        self.roomButton.setTitleColor(.lightGray, for: .normal)
        self.reviewButton.setTitleColor(.black, for: .normal)
      }
      
    }
  }
}
