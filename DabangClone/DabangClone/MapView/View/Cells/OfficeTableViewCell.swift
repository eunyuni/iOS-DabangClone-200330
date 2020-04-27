//
//  OfficeTableViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class OfficeTableViewCell: UITableViewCell {
  static let identifier = "OfficeTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 16)
  }
  private let addressLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
  }
  private let officeImage = UIImageView().then {
    $0.image = UIImage(named: "officeProfileImage")
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let leftRoomImage = UIImageView().then {
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let rightRoomImage = UIImageView().then {
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  
  private let phoneButton = UIButton().then {
    $0.setTitle("전화상담", for: .normal)
    $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
    $0.backgroundColor = #colorLiteral(red: 0.1430827379, green: 0.4055874646, blue: 1, alpha: 1)
    $0.layer.cornerRadius = 4
  }
  private let showRoomButton = UIButton().then {
    $0.setTitle("방 보러가기", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.1430827379, green: 0.4055874646, blue: 1, alpha: 1), for: .normal)
    $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 4
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = #colorLiteral(red: 0.1430827379, green: 0.4055874646, blue: 1, alpha: 1)
  }
  private let locationButton = UIButton().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 4
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = #colorLiteral(red: 0.1430827379, green: 0.4055874646, blue: 1, alpha: 1)
  }
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  @objc private func didTapPhoneButton(_ sender: UIButton) {
    
  }
  
  @objc private func didTapShowRoomButton(_ sender: UIButton) {
    
  }
  @objc private func didTapLocationButton(_ sender: UIButton) {
    
  }
  // MARK: - setupUI
  private func setupUI() {
    contentView.addSubviews([titleLabel, addressLabel, officeImage, phoneButton, showRoomButton, locationButton])
    phoneButton.addTarget(self, action: #selector(didTapPhoneButton(_:)), for: .touchUpInside)
    showRoomButton.addTarget(self, action: #selector(didTapShowRoomButton(_:)), for: .touchUpInside)
    locationButton.addTarget(self, action: #selector(didTapLocationButton(_:)), for: .touchUpInside)
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(35)
      $0.leading.equalToSuperview().offset(14)
    }
    addressLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
    }
    officeImage.snp.makeConstraints {
      $0.top.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(15)
      $0.height.width.equalTo(66)
    }
    locationButton.snp.makeConstraints {
      $0.top.equalTo(officeImage.snp.bottom).offset(15)
      $0.trailing.equalTo(officeImage.snp.trailing)
      $0.bottom.equalToSuperview().inset(24)
      $0.height.width.equalTo(self.viewController!.view.snp.height).multipliedBy(0.06)
    }
    
    phoneButton.snp.makeConstraints {
      $0.top.equalTo(locationButton.snp.top)
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.height.equalTo(locationButton.snp.height)
      $0.width.equalTo(showRoomButton.snp.width)
    }
    showRoomButton.snp.makeConstraints {
      $0.top.equalTo(locationButton.snp.top)
      $0.leading.equalTo(phoneButton.snp.leading).offset(6)
      $0.trailing.equalTo(locationButton.snp.leading).offset(-6)
      $0.height.equalTo(locationButton.snp.height)
      $0.width.equalTo(showRoomButton.snp.width)
    }
  }
  
}
