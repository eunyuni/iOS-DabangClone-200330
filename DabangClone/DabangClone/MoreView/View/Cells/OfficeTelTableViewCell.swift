//
//  OfficeTelTableViewCell.swift
//  ExpandableTableViewExample
//
//  Created by 정의석 on 2020/04/19.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class OfficeTelTableViewCell: UITableViewCell {
   static let identifier = "Officetel"

  let oneButton = UIButton().then {
    $0.setImage(UIImage(named: "unselectedButton"), for: .normal)
    $0.setImage(UIImage(named: "selectedButton"), for: .selected)

  }

  let twoButton = UIButton().then {
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
    
      contentView.addSubviews([oneButton, twoButton,])
    setupConstraints()
  }
  private func setupConstraints() {
    oneButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.top.equalToSuperview().offset(30)
      $0.bottom.equalToSuperview().offset(-20)
      $0.width.height.equalTo(32)
    }
    
    twoButton.snp.makeConstraints { $0.leading.equalTo(contentView.snp.centerX)
      $0.centerY.equalTo(oneButton)
      $0.size.equalTo(oneButton)
    }
    makeLabel()
  }
  private func makeLabel() {
    let buttons = [oneButton, twoButton,]
    buttons.forEach { i in
      i.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      let label = UILabel()
      switch i {
      case oneButton:
        label.text = "오피스텔"
      case twoButton:
        label.text = "도시형 생활주택"
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
    let buttons = [oneButton, twoButton]
    buttons.forEach {
      if $0 != sender && $0.isSelected == true {
        $0.isSelected.toggle()
      }
    }
    sender.isSelected.toggle()
    
    switch sender {
    case oneButton:
      SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .오피스텔, roomType: .오피스텔)
      delegate?.didSelectRoomType()
    case twoButton:
      SelectedRoomSingleton.shared.selectedRoom = SelectedRoom(roomStyle: .오피스텔, roomType: .도시형생활주택)
      delegate?.didSelectRoomType()
    default:
      break
    }
  }
  }
