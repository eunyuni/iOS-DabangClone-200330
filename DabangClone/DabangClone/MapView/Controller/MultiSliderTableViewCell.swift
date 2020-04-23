//
//  MultiSliderTableViewCell.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/22.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import MultiSlider
class MultiSliderTableViewCell: UITableViewCell {
  enum CellSliderType {
    case 보증금// 46
    case 월세
    case 매매가
    case 관리비
    case 방크기
  }
  // MARK: - Identifier
  static let identifier = "MultiSliderTableViewCell"
  // MARK: - Property

  private let titleLabel = UILabel().then {
    $0.text = "관리비"
  }
  private let rangeLabel = UILabel().then {
    $0.text = "무제한"
    $0.textColor = .blue
  }
  private var lowestNumber = 0
  private let multiSlider = MultiSlider().then {
    $0.isVertical = false
    $0.disabledThumbIndices = [2]
    $0.orientation = .horizontal
    $0.minimumValue = 0
    $0.maximumValue = 32
    $0.outerTrackColor = .gray
    $0.value = [0, 32]
    $0.valueLabelPosition = .notAnAttribute
    $0.tintColor = .blue
    $0.trackWidth = 3
    $0.snapStepSize = 2
    $0.showsThumbImageShadow = false

    $0.keepsDistanceBetweenThumbs = false
  }
  private let lowLabel = UILabel().then {
    $0.text = "0"
  }
  private let middleLabel = UILabel().then {
    $0.text = "16만 원"
  }
  private let highLabel = UILabel().then {
    $0.text = "무제한"
  }
  private let lowView = UIView().then {
    $0.backgroundColor = .gray
  }
  private let middleView = UIView().then {
    $0.backgroundColor = .gray
  }
  private let highView = UIView().then {
    $0.backgroundColor = .gray
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
  func configue(title: String) {
   
  }
  @objc private func sliderChanged(_ sender: MultiSlider) {
    print(sender.value)
    print(sender.maximumValue)
    print(sender.maximumValue == sender.value[1])
    if sender.maximumValue == sender.value[1]  {
      rangeLabel.text = "무제한"
    }
    print(Int(sender.value[0]))
    rangeLabel.text =  "\(Int(sender.value[0]))"
  }
  
  @objc private func sliderDragEnded(_ sender: MultiSlider) {
    
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([titleLabel, rangeLabel, multiSlider, lowLabel,middleLabel,highLabel,lowView,middleView,highView])
    multiSlider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(30)
    }
    rangeLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().inset(30)
    }
    multiSlider.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(30)
      $0.height.equalTo(30)
    }
    lowView.snp.makeConstraints {
      $0.top.equalTo(multiSlider.snp.bottom).offset(10)
      $0.centerX.equalTo(multiSlider.snp.leading)
      $0.height.equalTo(10)
      $0.width.equalTo(2)
    }
    middleView.snp.makeConstraints {
      $0.top.equalTo(lowView.snp.top)
      $0.centerX.equalTo(multiSlider.snp.centerX)
      $0.height.equalTo(10)
      $0.width.equalTo(2)
    }
    highView.snp.makeConstraints {
      $0.top.equalTo(lowView.snp.top)
      $0.centerX.equalTo(multiSlider.snp.trailing)
      $0.height.equalTo(10)
      $0.width.equalTo(2)
    }
    lowLabel.snp.makeConstraints {
      $0.top.equalTo(lowView.snp.bottom).offset(10)
      $0.centerX.equalTo(lowView.snp.centerX)
      $0.bottom.equalToSuperview().offset(-10)
    }
    middleLabel.snp.makeConstraints {
      $0.top.equalTo(lowLabel)
      $0.centerX.equalTo(middleView.snp.centerX)
    }
    highLabel.snp.makeConstraints {
      $0.top.equalTo(lowLabel)
      $0.centerX.equalTo(highView.snp.centerX)
    }
  }
}
