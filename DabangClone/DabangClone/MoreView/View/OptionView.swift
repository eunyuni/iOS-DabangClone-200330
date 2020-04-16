//
//  OptionView.swift
//  URLTest
//
//  Created by 황정덕 on 2020/03/31.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 방내농기 추가정보 옵션 저장
class OptionView: UIView {
  
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.text = "옵션 항목을 선택 하세요"
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .vertical
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.isPagingEnabled = true
    $0.backgroundColor = .clear
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    $0.bounces = false
    $0.register(OptionCollectionViewCell.self, forCellWithReuseIdentifier: OptionCollectionViewCell.identifier)
  }
  
  private let saveButton = UIButton().then {
    $0.setTitle("저장하기", for: .normal)
    $0.backgroundColor = .blue
  }
  
  let datas = ["중앙난방", "개별난방", "지역난방", "중앙냉난방", "개별냉난방", "지역냉난방", "기타"]
//    ["에어컨", "세탁기", "침대", "책상", "옷장", "TV", "신발장", "냉장고", "가스레인지", "인덕션", "전자레인지", "전자도어락", "비데"]
//  ["중앙난방", "개별난방", "지역난방", "중앙냉난방", "개별냉난방", "지역냉난방", "기타"]
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
    self.addSubviews([titleLabel,collectionView,saveButton])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.centerX.equalToSuperview()
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.bottom.equalTo(saveButton.snp.top)
    }
    
    saveButton.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    
  }
}

extension OptionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    datas.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCollectionViewCell.identifier, for: indexPath ) as! OptionCollectionViewCell
    cell.configue(title: datas[indexPath.row])
    return cell
  }
}

extension OptionView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width / 4, height: self.frame.height / 20)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 10
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
}

extension OptionView: UICollectionViewDelegate {
  
}
