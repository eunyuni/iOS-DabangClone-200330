//
//  SaleThemeTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 분양테마 셀
class SaleThemeTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  static let identifier = "SaleThemeTableViewCell"
  // MARK: - Property
  private let themeDatas = themes
  private let titleLabel = UILabel().then {
    $0.text = "테마 분양"
    $0.font = .systemFont(ofSize: 18)
    $0.textColor = .white
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
    $0.backgroundColor = UIColor(named: "PureLoginButtonColor")
    $0.register(SaleThemeCollectionViewCell.self, forCellWithReuseIdentifier: SaleThemeCollectionViewCell.identifier)
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
  
  // MARK: - setupUI
  private func setupUI() {
    collectionView.dataSource = self
    collectionView.delegate = self
    self.contentView.backgroundColor = UIColor(named: "PureLoginButtonColor")
    self.contentView.addSubviews([titleLabel, collectionView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(15)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-26)
      $0.height.equalTo(SaleMainViewController.frame.height / 8)
    }
  }
}

extension SaleThemeTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    themeDatas.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleThemeCollectionViewCell.identifier, for: indexPath ) as! SaleThemeCollectionViewCell
    let data = themeDatas[indexPath.item]
    cell.configue(theme: data)
    return cell
  }
}

extension SaleThemeTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 7 * 4, height: collectionView.frame.height)
  }
  
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 15
    return UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
  }
}

extension SaleThemeTableViewCell: UICollectionViewDelegate {
  
}
