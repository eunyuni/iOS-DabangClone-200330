//
//  AddressTextView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class AddressTextView: UIView {

    private let titleLabel = UILabel()
    private let imageView = UIImageView().then {
      $0.image = UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupUI()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func configue(title: String) {
      self.titleLabel.text = title
    }
    
    private func setupUI() {
      self.addSubviews([titleLabel, imageView])
      setupConstraint()
    }
    
    // MARK: - Layout
    private func setupConstraint() {
      titleLabel.snp.makeConstraints {
        $0.leading.equalToSuperview().inset(8)
        $0.centerY.equalToSuperview()
      }
      imageView.snp.makeConstraints {
        $0.trailing.equalToSuperview().inset(8)
        $0.centerY.equalToSuperview()
        $0.height.width.equalTo(titleLabel.snp.height)
        
      }
    }
  }
