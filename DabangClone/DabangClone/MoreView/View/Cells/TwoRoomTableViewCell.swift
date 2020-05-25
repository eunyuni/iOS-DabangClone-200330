//
//  TwoRoomTableViewCell.swift
//  ExpandableTableViewExample
//
//  Created by 정의석 on 2020/04/19.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class TwoRoomTableViewCell: UITableViewCell {
   static let identifier = "TwoRoom"
  var roomForSaleData = RoomForSale.shared

  let oneButton = UIButton().then {
    $0.setImage(UIImage(named: "unselectedButton"), for: .normal)
    $0.setImage(UIImage(named: "selectedButton"), for: .selected)
  }
  
  let twoButton = UIButton().then {
    $0.setImage(UIImage(named: "unselectedButton"), for: .normal)
    $0.setImage(UIImage(named: "selectedButton"), for: .selected)
  }
  
  let threeButton = UIButton().then {
    $0.setImage(UIImage(named: "unselectedButton"), for: .normal)
    $0.setImage(UIImage(named: "selectedButton"), for: .selected)
  }
  
  let fourButton = UIButton().then {
    $0.setImage(UIImage(named: "unselectedButton"), for: .normal)
    $0.setImage(UIImage(named: "selectedButton"), for: .selected)
  }

  weak var delegate: DidSelectRoomTypeDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    backgroundColor = UIColor(named: "CellBackgroundColor")
    
      contentView.addSubviews([oneButton, twoButton, threeButton, fourButton])
    setupConstraints()
  }
  private func setupConstraints() {
    oneButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.top.equalToSuperview().offset(30)
      $0.width.height.equalTo(32)
    }
    
    twoButton.snp.makeConstraints { $0.leading.equalTo(contentView.snp.centerX)
      $0.centerY.equalTo(oneButton)
      $0.size.equalTo(oneButton)
    }
    
    threeButton.snp.makeConstraints {
      $0.top.equalTo(oneButton.snp.bottom).offset(20)
      $0.centerX.equalTo(oneButton)
      $0.size.equalTo(oneButton)
      $0.bottom.equalToSuperview().offset(-20)
    }
    
    fourButton.snp.makeConstraints { $0.leading.equalTo(contentView.snp.centerX)
      $0.centerY.equalTo(threeButton)
      $0.size.equalTo(oneButton)
    }
    makeLabel()
  }
  private func makeLabel() {
    let buttons = [oneButton, twoButton, threeButton, fourButton]
    buttons.forEach { i in
      i.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      let label = UILabel()
      switch i {
      case oneButton:
        label.text = "단독주택"
      case twoButton:
        label.text = "다가구주택"
      case threeButton:
        label.text = "빌라/연립/다세대"
      case fourButton:
        label.text = "상가주택"
      default:
        break
      }
      contentView.addSubview(label)
      
      label.snp.makeConstraints {
        make in
        make.centerY.equalTo(i)
        make.leading.equalTo(i.snp.trailing).offset(10)
      }
      
    }
  }
  
  @objc private func didTapButton(_ sender: UIButton) {
    let buttons = [oneButton, twoButton, threeButton, fourButton]
    buttons.forEach {
      if $0 != sender && $0.isSelected == true {
        $0.isSelected.toggle()
      }
    }
    sender.isSelected.toggle()
    
    switch sender {
    case oneButton:
      SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .투룸, roomType: .단독주택)
      RoomForSale.shared.roomData.type = "투룸"
      delegate?.didSelectRoomType()
      case twoButton:
        SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .투룸, roomType: .다가구주택)
        RoomForSale.shared.roomData.type = "투룸"
      delegate?.didSelectRoomType()
      case threeButton:
      SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .투룸, roomType: .빌라연립다세대)
      RoomForSale.shared.roomData.type = "투룸"
      delegate?.didSelectRoomType()
      case fourButton:
      SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .투룸, roomType: .상가주택)
      RoomForSale.shared.roomData.type = "투룸"
      delegate?.didSelectRoomType()
    default:
      break
    }
  }

  }
