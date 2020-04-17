//
//  SaleTopTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

protocol SaleTopTableViewCellDelegate: class {
  func didTapInformationButton()
}

import UIKit
// 메인 셀
class SaleTopTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "SaleTopTableViewCell"
  
  weak var delegate: SaleTopTableViewCellDelegate?
  // MARK: - Property
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
    $0.register(SaleTopCollectionViewCell.self, forCellWithReuseIdentifier: SaleTopCollectionViewCell.identifier)
  }
  private let button = UIButton().then {
    $0.setTitle("분양정보 모두보기 >", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.setTitleColor(.black, for: .normal)
  }
//  private let bottomView = UIView().then {
//    $0.backgroundColor = .lightGray
//  }
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  @objc private func didTapButton(_ sender: UIButton){
    delegate?.didTapInformationButton()
  }
  // MARK: - setupUI
  private func setupUI() {
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.contentView.addSubviews([collectionView,button])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(SaleMainViewController.frame.height / 4)
      
    }
    button.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(SaleMainViewController.frame.height / 14)
      $0.bottom.equalToSuperview()
    }
//    bottomView.snp.makeConstraints {
//      $0.leading.trailing.bottom.equalToSuperview()
//      $0.height.equalTo(10)
//    }
  }
  
}

extension SaleTopTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleTopCollectionViewCell.identifier, for: indexPath ) as! SaleTopCollectionViewCell
    cell.backgroundColor = .red
    return cell
  }
}

extension SaleTopTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
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

extension SaleTopTableViewCell: UICollectionViewDelegate {
  
}
