//
//  ComplexTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexTableViewCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "ComplexTableViewCell"
  
  // MARK: -Property
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  private let titleView = UIView().then {
    $0.backgroundColor = .white
  }
  private let titleLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
  }
  private let subtitleLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textColor = .gray
  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
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
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    
  }
  

}
