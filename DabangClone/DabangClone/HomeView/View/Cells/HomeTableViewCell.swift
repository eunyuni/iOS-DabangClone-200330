//
//  HomeTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/03.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 페이지
class HomeTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "HomeTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 18)
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
//    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
//    $0.bounces = false
    $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
  }
  
  private let button = UIButton().then {
    $0.isHidden = true
    $0.backgroundColor = .red
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
  func configue(data: HomeData) {
    switch data.homeCellType {
    case .관심지역:
      titleLabel.text = data.homeInfo.setTitle()
    case .단지:
      titleLabel.text = data.homeInfo.setTitle()
      setupButton(width: 50,image: "homeButton")
    case .분양정보:
      titleLabel.text = data.homeInfo.setTitle()
      setupButton(width: 94,image: "listButton")
    case .추천콘텐츠:
      titleLabel.text = data.homeInfo.setTitle()
    }
  }
  
  @objc private func didTapButton(_sender : UIButton) {
    print("didTapButton")
  }
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([titleLabel, button, collectionView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(20)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(170)
    }
  }
  private func setupButton(width : CGFloat, image: String) {
    button.isHidden = false
    button.setImage(UIImage(named: image), for: .normal)
    button.addTarget(self, action: #selector(didTapButton(_sender:)), for: .touchUpInside)
    button.snp.makeConstraints {
      $0.centerY.equalTo(titleLabel.snp.centerY)
      $0.trailing.equalToSuperview().offset(-20)
      $0.height.equalTo(14)
      $0.width.equalTo(width)
    }
  }
}

extension HomeTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath ) as! HomeCollectionViewCell
    cell.backgroundColor = .red
    return cell
  }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width * 3 / 5, height: collectionView.frame.height - 20)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    20
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 20
    return UIEdgeInsets(top: 10, left: margin, bottom: 10, right: margin)
  }
}

extension HomeTableViewCell: UICollectionViewDelegate {
  
}
