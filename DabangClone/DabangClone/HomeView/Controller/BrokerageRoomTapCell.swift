//
//  BrokerageRoomTapCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

//let dummyBaseInfo = BaseInfoOfRoom(sellStyle: .월세, roomStyle: .원룸, cost: "500/30", detailText: "햇빛이 잘 드는 남향집" , adminCost: false, parking: true, shortRental: false, monthCost: "50만원", floorOfthisRoom: "6층", floorOfthisBuilding: 9,
//dedicatedArea: 18.34, supplyArea: 23.43, ableDaysToMoveIn: "05/30")

class BrokerageRoomTapCell: UITableViewCell {
  
  let dummyData = dummyBaseInfo
  
  // MARK: -Identifier
  static let identifier = "BrokerageRoomTapCell"
  
  // MARK: -Property
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 17, weight: .bold)
    $0.textColor = .black
  }
  let subLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  let explainLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13, weight: .regular)
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
  
  func configue(baseInfo: BaseInfoOfRoom) {
    
    
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    
  }
  
  
}
