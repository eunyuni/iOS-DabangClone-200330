//
//  ApplyAndCancelTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/05/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

protocol ApplyAndCancelTableViewCellDelegate: class {
  func didTapApplyButtonInRoomTypeCell() -> Void
}

class ApplyAndCancelTableViewCell: UITableViewCell {
  
  static let identifier = "ApplyAndCancelTableViewCell"
  
  weak var delegate: ApplyAndCancelTableViewCellDelegate?
  
  private lazy var cancelButton = UIButton().then {
    $0.setTitle("취소하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.backgroundColor = UIColor(named: "SegmentBezel")
  }
  
  private lazy var applyButton = UIButton().then {
    $0.setTitle("적용하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.addTarget(self, action: #selector(didTapApplyButton(_:)), for: .touchUpInside)
  }
  
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
    addSubviews([cancelButton, applyButton])
    setupConstraints()
  }
  
  private func setupConstraints() {
    cancelButton.snp.makeConstraints {
      $0.leading.top.equalToSuperview()
      $0.height.equalTo(44)
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    applyButton.snp.makeConstraints {
      $0.leading.equalTo(cancelButton.snp.trailing)
      $0.top.trailing.equalToSuperview()
      $0.height.equalTo(cancelButton)
    }
  }
  
  @objc private func didTapApplyButton(_ sender: UIButton) {
    FilterSingleton.shared.roomType = ""
    FilterSingleton.shared.roomType = TemporaryFilterSingleton.shared.roomType.map { btn -> String in
      switch btn.tag {
      case 0:
        return "원룸"
      case 1:
        return "투룸,쓰리룸"
      case 2:
        return "오피스텔"
      case 3:
        return "아파트"
      default:
        return ""
      }
    }.joined(separator: ",")
    
    if !FilterSingleton.shared.roomType.contains("원룸") {
      FilterRoomTypeSingleton.shared.원룸 = false
    } else {
      FilterRoomTypeSingleton.shared.원룸 = true
    }
    if !FilterSingleton.shared.roomType.contains("투룸") {
      FilterRoomTypeSingleton.shared.투쓰리룸 = false
    } else {
      FilterRoomTypeSingleton.shared.투쓰리룸 = true
    }
    if !FilterSingleton.shared.roomType.contains("오피스텔") {
      FilterRoomTypeSingleton.shared.오피스텔 = false
    } else {
      FilterRoomTypeSingleton.shared.오피스텔 = true
    }
    if !FilterSingleton.shared.roomType.contains("아파트") {
      FilterRoomTypeSingleton.shared.아파트 = false
    } else {
      FilterRoomTypeSingleton.shared.아파트 = true
    }
    print("결과",FilterSingleton.shared.roomType)
    
    FilterSingleton.shared.saleType = ""
    
    FilterSingleton.shared.saleType = TemporaryFilterSaleTypeSingleton.shared.saleType.map { btn -> String in
      switch btn.tag {
      case 0:
        return "월세"
      case 1:
        return "전세"
      case 2:
        return "매매"
      default:
        return ""
      }
    }.joined(separator: ",")
    
    if !FilterSingleton.shared.saleType.contains("월세") {
      FilterSaleTypeSingleton.shared.월세 = false
    } else {
      FilterSaleTypeSingleton.shared.월세 = true
    }
    if !FilterSingleton.shared.saleType.contains("전세") {
      FilterSaleTypeSingleton.shared.전세 = false
    } else {
      FilterSaleTypeSingleton.shared.전세 = true
    }
    if !FilterSingleton.shared.saleType.contains("매매") {
      FilterSaleTypeSingleton.shared.매매 = false
    } else {
      FilterSaleTypeSingleton.shared.매매 = true
    }
    
    print("결과",FilterSingleton.shared.saleType)
    
    
    delegate?.didTapApplyButtonInRoomTypeCell()
  }
  
}
