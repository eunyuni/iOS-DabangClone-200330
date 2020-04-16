//
//  ScrollButton.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
protocol ScrollButtonDelegate: class {
  func didTapButton(tag: Int)
}
class ScrollButton: UIButton {

    weak var delegate: ScrollButtonDelegate?
    let underLineView = UIView()
    override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
    }
    
    convenience init(title: String, tag: Int) {
      self.init(frame: .zero)
      self.setTitle(title, for: .normal)
      self.tag = tag
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
      addSubview(underLineView)
      underLineView.backgroundColor = .black
      underLineView.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview()
        $0.height.equalTo(2)
      }
      underLineView.isHidden = true
      
      addCharacterSpacing(kernValue: -10)
      setTitleColor(.lightGray, for: .normal)
      backgroundColor = .white
      titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
      addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc func tap() {
      self.delegate?.didTapButton(tag: tag)
    }
  }
