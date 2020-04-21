//
//  SaleGuideTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 메인 가이드 셀
class SaleGuideTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  static let identifier = "SaleGuideTableViewCell"
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.text = "분양 가이드"
    $0.font = .systemFont(ofSize: 18)
  }
  private let housingView = GuideView().then {
    $0.setGrayType(imageName: "guide1Image", title: "주택청약 절차 알아보기")
  }
  private let saleTermView = GuideView().then {
    $0.setGrayType(imageName: "guide2Image", title: "분양 용어 알아보기")
  }
  private let questionView = GuideView().then {
    $0.setGrayType(imageName: "guide3Image", title: "분양 자주 하는 질문")
  }
  private let calculationView = GuideView().then {
    $0.setBlueType(imageName: "guide4Image", title: "청약가점 계산")
  }
  private let diagnosisView = GuideView().then {
    $0.setBlueType(imageName: "guide5Image", title: "입주자격 진단")
  }
  
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .white
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
    $0.register(ImageViewCollectionViewCell.self, forCellWithReuseIdentifier: ImageViewCollectionViewCell.identifier)
  }
  private let imageDatas = ["iparkImage","prugioImage","eworldImage","skviewImage"]
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
    self.contentView.addSubviews([titleLabel, housingView, saleTermView, questionView, calculationView, diagnosisView, collectionView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(30)
      $0.leading.equalToSuperview().offset(15)
    }
    housingView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(56)
    }
    saleTermView.snp.makeConstraints {
      $0.top.equalTo(housingView.snp.bottom).offset(8)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(56)
    }
    questionView.snp.makeConstraints {
      $0.top.equalTo(saleTermView.snp.bottom).offset(8)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(56)
    }
    calculationView.snp.makeConstraints {
      $0.top.equalTo(questionView.snp.bottom).offset(12)
      $0.leading.equalToSuperview().inset(15)
      $0.trailing.equalTo(self.snp.centerX).offset(-5)
      $0.height.equalTo(60)
      
    }
    diagnosisView.snp.makeConstraints {
      $0.top.equalTo(questionView.snp.bottom).offset(12)
      $0.trailing.equalToSuperview().inset(15)
      $0.leading.equalTo(self.snp.centerX).offset(5)
      $0.height.equalTo(60)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(calculationView.snp.bottom).offset(60)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(48)
    }
  }
  
}


extension SaleGuideTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCollectionViewCell.identifier, for: indexPath ) as! ImageViewCollectionViewCell
    cell.configue(imageName: imageDatas[indexPath.item])
    return cell
  }
}

extension SaleGuideTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    2
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

extension SaleGuideTableViewCell: UICollectionViewDelegate {
  
}



class GuideView: UIView {
  // MARK: - Property
  private let imageView = UIImageView()
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15)
  }
  private let rightImageView = UIImageView().then {
    $0.image = UIImage(systemName: "chevron.right")
    //      ?.withTintColor(.black, renderingMode: .alwaysOriginal)
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
  func setGrayType(imageName: String, title: String) {
    imageView.image = UIImage(named: imageName)
    titleLabel.text = title
    self.backgroundColor = UIColor(named: "TextFieldColor")
    rightImageView.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
    rightImageView.image?.withTintColor(.black, renderingMode: .automatic)
  }
  func setBlueType(imageName: String, title: String) {
    imageView.image = UIImage(named: imageName)
    titleLabel.text = title
    titleLabel.textColor = UIColor(named: "regulationColor")
    rightImageView.image?.withTintColor(.blue, renderingMode: .alwaysOriginal)
    self.layer.borderWidth = 0.6
    self.layer.borderColor = UIColor(named: "regulationColor")?.cgColor
  }
  // MARK: - setupUI
  private func setupUI() {
    self.layer.cornerRadius = 10
    self.addSubviews([imageView, titleLabel, rightImageView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.height.width.equalTo(30)
      $0.leading.equalTo(9)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(6)
      $0.centerY.equalToSuperview()
    }
    rightImageView.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(9)
      $0.centerY.equalToSuperview()
      $0.width.equalTo(11)
      $0.height.equalTo(13)
    }
  }
}

