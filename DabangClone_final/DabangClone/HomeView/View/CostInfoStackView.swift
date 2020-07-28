//
//  CostInfoStackView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CostInfoStackView: UIStackView {
  
  let costCell = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 0.6
    $0.backgroundColor = .white
  }
  let costInnerCell = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel = UILabel().then {
    $0.text = "월세"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell1 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 0.6
    $0.backgroundColor = .white
  }
  let costInnerCell1 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel1 = UILabel().then {
    $0.text = "관리비"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel1 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell2 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 0.6
    $0.backgroundColor = .white
  }
  let costInnerCell2 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel2 = UILabel().then {
    $0.text = "주차"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel2 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell3 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 0.6
    $0.backgroundColor = .white
  }
  let costInnerCell3 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel3 = UILabel().then {
    $0.text = "단기임대"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel3 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell4 = UIView().then {
    $0.layer.borderColor = UIColor(named: "totalBezelColor")?.cgColor
    $0.layer.borderWidth = 0.6
    $0.backgroundColor = .white
  }
  let costInnerCell4 = UIView().then {
    $0.backgroundColor = UIColor(named: "totalColor")
  }
  let costCellTitleLabel4 = UILabel().then {
    $0.text = "한달\n총 생활비"
    $0.numberOfLines = 0
    $0.textColor = UIColor(named: "totalTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel4 = UILabel().then {
    $0.attributedText = NSMutableAttributedString()
    .normal("월세", fontSize: 16)
    $0.textColor = UIColor(named: "totalInnerTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel5 = UILabel().then {
    $0.attributedText = NSMutableAttributedString()
    .normal("한달 총 생활비", fontSize: 16)
    $0.textColor = UIColor(named: "totalInnerTextColor")
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    axis = .vertical
    distribution = .fillEqually
    alignment = .fill
    spacing = 0
    
    addArrangedSubviews([costCell, costCell1, costCell2, costCell3, costCell4])
    arrangedSubviews[0].addSubviews([costInnerCell, costCellTitleLabel, costCellInnerLabel])
    arrangedSubviews[1].addSubviews([costInnerCell1, costCellTitleLabel1, costCellInnerLabel1])
    arrangedSubviews[2].addSubviews([costInnerCell2, costCellTitleLabel2, costCellInnerLabel2])
    arrangedSubviews[3].addSubviews([costInnerCell3, costCellTitleLabel3, costCellInnerLabel3])
    arrangedSubviews[4].addSubviews([costInnerCell4, costCellTitleLabel4, costCellInnerLabel4, costCellInnerLabel5])
    setupConstaints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(salesFormType: String, titles: [String]) {
    costCellTitleLabel.text = salesFormType
    
    if titles.count == 6 {
    titles.enumerated().forEach { (idx, ele) in
       if idx == 5 {
        (arrangedSubviews[4].subviews[3] as! UILabel).attributedText = NSMutableAttributedString().bold("\(ele)", fontSize: 16)
       } else {
      (arrangedSubviews[idx].subviews[2] as! UILabel).text = "\(ele)"
      }
    }
    } else {
      print("wrong Data")
    }
  }
  
  private func setupConstaints() {
    arrangedSubviews[0].snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.18)
    }
    arrangedSubviews[0].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[0].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[0].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[0].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[0].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[0].subviews[1])
      $0.leading.equalTo(arrangedSubviews[0].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[1].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[0].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.18)
    }
    arrangedSubviews[1].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[1].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[1].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[1].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[1].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[1].subviews[1])
      $0.leading.equalTo(arrangedSubviews[1].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[2].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[1].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.18)
    }
    arrangedSubviews[2].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[2].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[2].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[2].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[2].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[2].subviews[1])
      $0.leading.equalTo(arrangedSubviews[2].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[3].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[2].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.18)
    }
    arrangedSubviews[3].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[3].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[3].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[3].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[3].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[3].subviews[1])
      $0.leading.equalTo(arrangedSubviews[3].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[4].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[3].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.28)
    }
    arrangedSubviews[4].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[4].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[4].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[4].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[4].subviews[2].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[4].subviews[1])
      $0.leading.equalTo(arrangedSubviews[4].subviews[0].snp.trailing).offset(10)
    }
    arrangedSubviews[4].subviews[3].snp.makeConstraints {
      $0.bottom.equalTo(arrangedSubviews[4].subviews[1])
      $0.leading.equalTo(arrangedSubviews[4].subviews[0].snp.trailing).offset(10)
    }
  }
}

