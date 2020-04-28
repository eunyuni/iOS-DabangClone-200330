//
//  SaleDetailNearMapCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양상세화면 → 위치 및 주변 시설
class SaleDetailNearMapCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "SaleDetailNearMapCell"
  
  // MARK: -Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
    $0.text = "위치 및 주변 시설"
  }
  private let addressLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13, weight: .regular)
    $0.textColor = .black
  }
  private let addressButton = UIButton().then {
    $0.setTitle("도로명", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 11, weight: .regular)
    $0.layer.cornerRadius = 4
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 0.6
  }
  private let googleMap = GMSMapView()
  private let nearLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
    $0.text = "가까운 주요 주변 시설"
  }
  private let martImage = UIImageView().then {
    $0.image = UIImage(named: "MartIcon")
  }
  private let hospitalImage = UIImageView().then {
    $0.image = UIImage(named: "HospitalIcon")
  }
  private let instituteImage = UIImageView().then {
    $0.image = UIImage(named: "InstituteIcon")
  }
  private let culturalImage = UIImageView().then {
    $0.image = UIImage(named: "CulturalIcon")
  }
  private let mart = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "대형마트"
  }
  private let hospital = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "병원"
  }
  private let institute = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "공공기관"
  }
  private let cultural = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "문화시설"
  }
  private let martLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  private let hospitalLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  private let instituteLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  private let culturalLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  private let martSpaceLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let hospitalSpaceLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let instituteSpaceLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let culturalSpaceLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let addMapButton = UIButton().then {
    $0.layer.borderWidth = 0.8
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 4
    $0.setTitle("주변시설 지도로 더보기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
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
  
  func configue(addressLabel: String, mart: String, hospital: String, institute: String, cultural: String, martSpace: String, hospitalSpace: String, instituteSpace: String, culturalSpace: String) {
    self.addressLabel.text = addressLabel
    self.martLable.text = mart
    self.hospitalLable.text = hospital
    self.instituteLable.text = institute
    self.culturalLable.text = cultural
    self.martSpaceLable.text = martSpace
    self.hospitalSpaceLable.text = hospitalSpace
    self.instituteSpaceLable.text = instituteSpace
    self.culturalSpaceLable.text = culturalSpace
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubviews([
      titleLabel,
      addressLabel,
      addressButton,
      googleMap,
      nearLabel,
      martImage,
      hospitalImage,
      instituteImage,
      culturalImage,
      mart,
      hospital,
      institute,
      cultural,
      martLable,
      hospitalLable,
      instituteLable,
      culturalLable,
      martSpaceLable,
      hospitalSpaceLable,
      instituteSpaceLable,
      culturalSpaceLable,
      addMapButton,
      
    ])
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(26)
    }
    addressLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(14)
      $0.leading.equalTo(titleLabel)
    }
    addressButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.trailing.equalToSuperview().inset(26)
      $0.width.equalTo(50)
    }
    googleMap.snp.makeConstraints {
      $0.top.equalTo(addressLabel.snp.bottom).offset(18)
      $0.width.equalToSuperview()
      $0.height.equalTo(280)
    }
    nearLabel.snp.makeConstraints {
      $0.top.equalTo(googleMap.snp.bottom).offset(20)
      $0.leading.equalTo(titleLabel)
    }
    martImage.snp.makeConstraints {
      $0.top.equalTo(nearLabel.snp.bottom).offset(10)
      $0.leading.equalTo(titleLabel)
    }
    hospitalImage.snp.makeConstraints {
      $0.top.equalTo(martImage.snp.bottom).offset(10)
      $0.leading.equalTo(titleLabel)
    }
    instituteImage.snp.makeConstraints {
      $0.top.equalTo(hospitalImage.snp.bottom).offset(10)
      $0.leading.equalTo(titleLabel)
    }
    culturalImage.snp.makeConstraints {
      $0.top.equalTo(instituteImage.snp.bottom).offset(10)
      $0.leading.equalTo(titleLabel)
    }
    mart.snp.makeConstraints {
      $0.centerY.equalTo(martImage)
      $0.leading.equalTo(martImage.snp.trailing).offset(16)
    }
    hospital.snp.makeConstraints {
      $0.centerY.equalTo(hospitalImage)
      $0.leading.equalTo(hospitalImage.snp.trailing).offset(16)
    }
    institute.snp.makeConstraints {
      $0.centerY.equalTo(instituteImage)
      $0.leading.equalTo(instituteImage.snp.trailing).offset(16)
    }
    cultural.snp.makeConstraints {
      $0.centerY.equalTo(culturalImage)
      $0.leading.equalTo(culturalImage.snp.trailing).offset(16)
    }
    martLable.snp.makeConstraints {
      $0.centerY.equalTo(martImage)
      $0.leading.equalTo(mart.snp.trailing).offset(26)
    }
    hospitalLable.snp.makeConstraints {
      $0.centerY.equalTo(hospitalImage)
      $0.leading.equalTo(martLable)
    }
    instituteLable.snp.makeConstraints {
      $0.centerY.equalTo(instituteImage)
      $0.leading.equalTo(martLable)
    }
    culturalLable.snp.makeConstraints {
      $0.centerY.equalTo(culturalImage)
      $0.leading.equalTo(martLable)
    }
    martSpaceLable.snp.makeConstraints {
      $0.centerY.equalTo(martImage)
      $0.trailing.equalToSuperview().inset(20)
    }
    hospitalSpaceLable.snp.makeConstraints {
      $0.centerY.equalTo(hospitalImage)
      $0.trailing.equalTo(martSpaceLable)
    }
    instituteSpaceLable.snp.makeConstraints {
      $0.centerY.equalTo(instituteImage)
      $0.trailing.equalTo(martSpaceLable)
    }
    culturalSpaceLable.snp.makeConstraints {
      $0.centerY.equalTo(culturalImage)
      $0.trailing.equalTo(martSpaceLable)
    }
    addMapButton.snp.makeConstraints {
      $0.top.equalTo(culturalImage.snp.bottom).offset(26)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(50)
      $0.bottom.equalToSuperview().inset(26)
    }
  }
  
  
}
