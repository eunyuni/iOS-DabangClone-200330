//
//  ComplexRecommendTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexRecommendTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  static let identifier = "ComplexRecommendTableViewCell"
  
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.text = "주변 추천 단지"
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    
  }
  
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .white
    $0.register(ComplexRecommendCollectionViewCell.self, forCellWithReuseIdentifier: ComplexRecommendCollectionViewCell.identifier)
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
    self.contentView.addSubviews([titleLabel, collectionView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(18)
      $0.leading.equalToSuperview().offset(26)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.height.equalTo(136)
    }
  }
}

extension ComplexRecommendTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComplexRecommendCollectionViewCell.identifier, for: indexPath ) as! ComplexRecommendCollectionViewCell
    cell.configue(title: "롯데캐슬프레지던트")
        cell.backgroundColor = .red
    return cell
  }
}
extension ComplexRecommendTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
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
    let margin: CGFloat = 18
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
}
