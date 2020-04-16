//
//  FindAreaButtonCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FindAreaTypeCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "FindAreaTypeCell"
  
  // MARK: -Property
  private let nonhyeonButton = UIButton().then {
    $0.setTitle("논현동", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let sinrimButton = UIButton().then {
    $0.setTitle("신림역", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.layer.cornerRadius = 4
  }
  private let seoulButton = UIButton().then {
//    $0.setTitle("서울대학교", for: .normal)
    $0.setImage(UIImage(named: "SeoulButtonImage"), for: .normal)
//    $0.setTitleColor(.black, for: .normal)
//    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
//    $0.backgroundColor = .white
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.cornerRadius = 4
  }
  private let nowButton = UIButton().then {
//    $0.setTitle("현재위치", for: .normal)
    $0.setImage(UIImage(named: "NowButtonImage"), for: .normal)
//    $0.setTitleColor(.black, for: .normal)
//    $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
//    $0.backgroundColor = .white
//    $0.layer.borderWidth = 0.6
//    $0.layer.borderColor = UIColor.lightGray.cgColor
//    $0.layer.cornerRadius = 4
  }
 
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      nonhyeonButton,
      sinrimButton,
      seoulButton,
      nowButton,
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    nonhyeonButton.snp.makeConstraints {
      $0.top.equalToSuperview().inset(4)
      $0.leading.equalToSuperview().inset(14)
      $0.bottom.equalToSuperview().offset(-Padding.topBottom / 2)
      $0.width.equalTo(54)
      $0.height.equalTo(32)
    }
    sinrimButton.snp.makeConstraints {
      $0.top.equalTo(nonhyeonButton)
      $0.leading.equalTo(nonhyeonButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(nonhyeonButton)
      $0.height.equalTo(nonhyeonButton)
    }
    seoulButton.snp.makeConstraints {
      $0.top.equalTo(nonhyeonButton)
      $0.leading.equalTo(sinrimButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(72)
      $0.height.equalTo(nonhyeonButton)
    }
    nowButton.snp.makeConstraints {
      $0.top.equalTo(nonhyeonButton)
      $0.leading.equalTo(seoulButton.snp.trailing).offset(Padding.spacing)
      $0.width.equalTo(seoulButton)
      $0.height.equalTo(nonhyeonButton)
    }
  }
  

}
