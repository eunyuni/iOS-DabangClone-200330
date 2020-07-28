//
//  DetailInfoStackView.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/15.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class DetailInfoStackView: UIStackView {
  
  let costCell = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel = UILabel().then {
    $0.text = "방종류"
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
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell1 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel1 = UILabel().then {
    $0.text = "해당층/건물층"
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
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell2 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel2 = UILabel().then {
    $0.text = "전용/공급면적"
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
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell3 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel3 = UILabel().then {
    $0.text = "난방종류"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel3 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell4 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell4 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel4 = UILabel().then {
    $0.text = "빌트인"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel4 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell5 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell5 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel5 = UILabel().then {
    $0.text = "엘리베이터"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel5 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell6 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell6 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel6 = UILabel().then {
    $0.text = "반려동물"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel6 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell7 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell7 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel7 = UILabel().then {
    $0.text = "베란다/발코니"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel7 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell8 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell8 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel8 = UILabel().then {
    $0.text = "전세자금대출"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel8 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  let costCell9 = UIView().then {
    $0.layer.borderColor = UIColor(named: "SegmentBackground")?.cgColor
    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let costInnerCell9 = UIView().then {
    $0.backgroundColor = UIColor(named: "CostCellColor")
  }
  let costCellTitleLabel9 = UILabel().then {
    $0.text = "입주가능일"
    $0.textColor = .lightGray
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  let costCellInnerLabel9 = UILabel().then {
    $0.text = "123"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16, weight: .light)
  }
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    axis = .vertical
    distribution = .fillEqually
    alignment = .fill
    spacing = 0
    
    addArrangedSubviews([costCell, costCell1, costCell2, costCell3, costCell4, costCell5, costCell6, costCell7, costCell8, costCell9])
    arrangedSubviews[0].addSubviews([costInnerCell, costCellTitleLabel, costCellInnerLabel])
    arrangedSubviews[1].addSubviews([costInnerCell1, costCellTitleLabel1, costCellInnerLabel1])
    arrangedSubviews[2].addSubviews([costInnerCell2, costCellTitleLabel2, costCellInnerLabel2])
    arrangedSubviews[3].addSubviews([costInnerCell3, costCellTitleLabel3, costCellInnerLabel3])
    arrangedSubviews[4].addSubviews([costInnerCell4, costCellTitleLabel4, costCellInnerLabel4])
    arrangedSubviews[5].addSubviews([costInnerCell5, costCellTitleLabel5, costCellInnerLabel5])
    arrangedSubviews[6].addSubviews([costInnerCell6, costCellTitleLabel6, costCellInnerLabel6])
    arrangedSubviews[7].addSubviews([costInnerCell7, costCellTitleLabel7, costCellInnerLabel7])
    arrangedSubviews[8].addSubviews([costInnerCell8, costCellTitleLabel8, costCellInnerLabel8])
    arrangedSubviews[9].addSubviews([costInnerCell9, costCellTitleLabel9, costCellInnerLabel9])
    setupConstaints()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(titles: [String]) {
    if titles.count == 10 {
      titles.enumerated().forEach { (idx, ele) in
        (arrangedSubviews[idx].subviews[2] as! UILabel).text = "\(ele)"
      }
    } else {
      print("wrong Data")
    }
  }
  
  private func setupConstaints() {
    arrangedSubviews[0].snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
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
      $0.height.equalToSuperview().multipliedBy(0.1)
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
      $0.height.equalToSuperview().multipliedBy(0.1)
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
      $0.height.equalToSuperview().multipliedBy(0.1)
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
      $0.height.equalToSuperview().multipliedBy(0.1)
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
      $0.centerY.equalTo(arrangedSubviews[4].subviews[1])
      $0.leading.equalTo(arrangedSubviews[4].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[5].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[4].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    arrangedSubviews[5].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[5].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[5].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[5].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[5].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[5].subviews[1])
      $0.leading.equalTo(arrangedSubviews[5].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[6].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[5].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    arrangedSubviews[6].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[6].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[6].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[6].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[6].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[6].subviews[1])
      $0.leading.equalTo(arrangedSubviews[6].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[7].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[6].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    arrangedSubviews[7].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[7].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[7].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[7].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[7].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[7].subviews[1])
      $0.leading.equalTo(arrangedSubviews[7].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[8].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[7].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    arrangedSubviews[8].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[8].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[8].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[8].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[8].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[8].subviews[1])
      $0.leading.equalTo(arrangedSubviews[8].subviews[0].snp.trailing).offset(10)
    }
    
    arrangedSubviews[9].snp.makeConstraints {
      $0.top.equalTo(arrangedSubviews[8].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    arrangedSubviews[9].subviews[0].snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(1)
      $0.bottom.equalTo(arrangedSubviews[9].snp.bottom).offset(-1)
      $0.width.equalToSuperview().multipliedBy(0.333)
    }
    arrangedSubviews[9].subviews[1].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[9].subviews[0])
      $0.leading.equalToSuperview().offset(10)
    }
    arrangedSubviews[9].subviews[2].snp.makeConstraints {
      $0.centerY.equalTo(arrangedSubviews[9].subviews[1])
      $0.leading.equalTo(arrangedSubviews[9].subviews[0].snp.trailing).offset(10)
    }
    
    
    
  }
}

