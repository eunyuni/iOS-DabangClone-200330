//
//  SaleInformationTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 분양 셀
class SaleInformationTableViewCell: UITableViewCell {

  // MARK: - Identifier
  static let identifier = "SaleInformationTableViewCell"
  // MARK: - Property
  private let saleTypeLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 11)
    $0.textColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.8276094794, green: 0, blue: 0.08192314953, alpha: 1)
    $0.layer.cornerRadius = 10
  }
  private let saleDateLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
    $0.textColor = #colorLiteral(red: 0.2002735138, green: 0.3840204477, blue: 0.7746787071, alpha: 1)
    $0.textColor = #colorLiteral(red: 0.1062248126, green: 0.3019269109, blue: 0.5715846419, alpha: 1)
    $0.textColor = #colorLiteral(red: 0.8276094794, green: 0, blue: 0.08192314953, alpha: 1)
    $0.textColor = #colorLiteral(red: 0.8276094794, green: 0, blue: 0.08192314953, alpha: 1)
    
  }
  private let saleTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
  }
  private let priceLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 17)
  }
  private let locationLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.textColor = #colorLiteral(red: 0.5332907438, green: 0.5333573818, blue: 0.5332680941, alpha: 1)
  }
  private let firstLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.textColor = #colorLiteral(red: 0.4666288495, green: 0.4666878581, blue: 0.4666086435, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    $0.layer.cornerRadius = 10
  }
  private let secondLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.textColor = #colorLiteral(red: 0.4666288495, green: 0.4666878581, blue: 0.4666086435, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    $0.layer.cornerRadius = 10
  }
  private let thirdLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12)
    $0.textColor = #colorLiteral(red: 0.4666288495, green: 0.4666878581, blue: 0.4666086435, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    $0.layer.cornerRadius = 10
  }
  private let saleImageView = UIImageView()
  
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue() {
    saleTypeLabel.text = " 분양예정 "
    saleDateLabel.text = "20년 하반기 모집공고"
    saleTitleLabel.text = "광주화정2 1"
    priceLabel.text = "분양가 준비중"
    locationLabel.text = "광주광역시 서구 화정동"
    firstLabel.text = " 아파트 "
    secondLabel.text = " 공공분양 "
    saleImageView.image = UIImage(named: "saleEmptyImage")
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([saleTypeLabel, saleDateLabel, saleTitleLabel, saleImageView, priceLabel, firstLabel, secondLabel, thirdLabel, locationLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    saleTypeLabel.snp.makeConstraints {
      $0.leading.top.equalToSuperview().offset(15)
    }
    saleDateLabel.snp.makeConstraints {
      $0.centerY.equalTo(saleTypeLabel.snp.centerY)
      $0.leading.equalTo(saleTypeLabel.snp.trailing).offset(4)
    }
    saleTitleLabel.snp.makeConstraints {
      $0.top.equalTo(saleTypeLabel.snp.bottom).offset(8)
      $0.leading.equalTo(saleTypeLabel.snp.leading)
    }
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(saleTitleLabel.snp.bottom).offset(5)
      $0.leading.equalTo(saleTypeLabel.snp.leading)
    }
    locationLabel.snp.makeConstraints {
      $0.top.equalTo(priceLabel.snp.bottom).offset(6)
      $0.leading.equalTo(saleTypeLabel.snp.leading)
    }
    firstLabel.snp.makeConstraints {
      $0.top.equalTo(locationLabel.snp.bottom).offset(6)
      $0.leading.equalTo(saleTypeLabel.snp.leading)
      $0.bottom.leading.equalToSuperview().inset(16)
    }
    secondLabel.snp.makeConstraints {
      $0.leading.equalTo(firstLabel.snp.trailing).offset(5)
      $0.centerY.equalTo(firstLabel.snp.centerY)
    }
    thirdLabel.snp.makeConstraints {
      $0.leading.equalTo(secondLabel.snp.trailing).offset(5)
      $0.centerY.equalTo(firstLabel.snp.centerY)
    }
    saleImageView.snp.makeConstraints {
      $0.top.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(90)
      $0.width.equalTo(134)
    }
  }
}

class SaleImageView: UIImageView {
  // MARK: - Property
  private let saleTypeLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 11)
  }
  private let saleDateLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 13)
  }
  private let saleTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
  }
  private let locationLabel = UILabel()
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([saleTypeLabel, saleDateLabel, saleTitleLabel, locationLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
  }
}
