//
//  SaleDetailMainCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양상세화면 → 메인화면사진뷰 셀
class SaleDetailMainCell: UITableViewCell {

  // MARK: -Identifier
  static let identifier = "SaleDetailMainCell"
  
  // MARK: -Property
  let mainView = UIImageView()
//    .then {
//    $0.image = UIImage(named: "SaleMainImage")
//    $0.contentMode = .scaleToFill
//    $0.clipsToBounds = false
//    $0.backgroundColor = .gray
//  }
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -Action
  
  func configue(imgae: URL) {
//    mainView.image = UIImage(named: imgae)
    mainView.kf.setImage(with: imgae)
  }
  
  // MARK: -setupUI
  
  private func setupUI() {
    contentView.addSubview(mainView)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    mainView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.height.equalTo(280)
    }
  }
  
  

}
