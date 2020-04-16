//
//  AddressSelectView.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 아파트 주소찾기 시/도/동 정덕 0
class AddressSelectView: UIView {
  
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.text = "시/도 선택"
  }
  
  private let cancelButton = UIButton().then {
    $0.setTitle("취소", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  private let okButton = UIButton().then {
    $0.setTitle("확인", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .vertical
  }
  private lazy var potoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.isPagingEnabled = true
    $0.backgroundColor = .clear
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    $0.bounces = false
    $0.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: TextCollectionViewCell.identifier)
  }
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
    self.addSubviews([titleLabel,potoCollectionView,cancelButton,okButton])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    potoCollectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.bottom.equalTo(cancelButton.snp.top)
    }
    cancelButton.snp.makeConstraints {
      //      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.bottom.equalToSuperview()
      $0.trailing.equalTo(self.snp.centerX)
      $0.height.equalToSuperview().multipliedBy(0.1)
      $0.bottom.equalToSuperview()
    }
    
    okButton.snp.makeConstraints {
      $0.trailing.bottom.equalToSuperview()
      $0.leading.equalTo(self.snp.centerX)
      $0.height.equalToSuperview().multipliedBy(0.1)
      $0.bottom.equalToSuperview()
    }
  }
}

// 레스톨?
extension AddressSelectView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCollectionViewCell.identifier, for: indexPath ) as! TextCollectionViewCell
    cell.configue(title: "test")
    cell.backgroundColor = .white
    return cell
  }
}
extension AddressSelectView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width / 2 - 40 / 2, height: self.frame.height / 11)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 0
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
}
extension AddressSelectView: UICollectionViewDelegate {
  
}
