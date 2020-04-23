//
//  MapScrollButton.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
protocol MapScrollButtonDelegate: class {
  func didTapButton(tag: Int)
}
class MapScrollButton: UIButton {
  weak var delegate: MapScrollButtonDelegate?
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
      self.layer.cornerRadius = 5
      self.layer.borderWidth = 0.6
      self.layer.borderColor = UIColor.lightGray.cgColor
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
