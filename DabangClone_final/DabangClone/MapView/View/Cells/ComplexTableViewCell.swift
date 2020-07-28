//
//  ComplexTableViewCell.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/28.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexTableViewCell: UITableViewCell {
  
  // MARK: -Identifier
  static let identifier = "ComplexTableViewCell"
  
  // MARK: -Property
    
    private var data: Complex? {
        didSet{
            guard let data = data else { return }
            buildDateLabel.text = data.buildDate
            totalNumberLabel.text = data.totalNumber
            totalCitizenLabel.text = data.totalCitizen
            personalParkLabel.text = data.personalPark
            buildingTypeLable.text = data.buildingType
            supplyTypeLable.text = data.constructionCompany
            complexTypeLabel.text = data.complexType
            heatingSystemLabel.text = data.heatingSystem
            cityGasLabel.text = data.fuel
            ratioLabel.text = data.dryWasteRate
        }
    }
    
  private var layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
    
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .white
    $0.isPagingEnabled = true
    $0.register(ComplexCollectionViewCell.self, forCellWithReuseIdentifier: ComplexCollectionViewCell.identifier)
  }
  
  private let sectionView = UIView().then {
    $0.backgroundColor = .white
  }
  private let explainView = UIView().then {
    $0.backgroundColor = .white
  }
  
  // 준공년월
  private let buildDate = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "준공년월"
  }
  private let buildDateLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 총 동수
  private let totalNumber = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "총 동수"
  }
  private let totalNumberLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 총 세대수
  private let totalCitizen = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "총 세대수"
  }
  private let totalCitizenLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  // 주차대수
  private let personalPark = UILabel().then {
    $0.font = .systemFont(ofSize: 11, weight: .regular)
    $0.textColor = .gray
    $0.text = "주차대수"
  }
  private let personalParkLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = .black
  }
  
  private let moldImage = UIImageView().then {
    $0.image = UIImage(named: "SaleTapImage")
  }
  
  // 건물 유형
  private let buildingType = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "건물 유형"
  }
  private let buildingTypeLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 건설사
  private let supplyType = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "건설사"
  }
  private let supplyTypeLable = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 단지규모
  private let sizeComplex = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "단지규모"
  }
  private let sizeComplexLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 단지타입
  private let complexType = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "단지타입"
  }
  private let complexTypeLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 난방방식
  private let heatingSystem = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "난방방식"
  }
  private let heatingSystemLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 연료
  private let cityGas = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "연료"
  }
  private let cityGasLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  // 용적률/건폐율
  private let ratio = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .bold)
    $0.textColor = .black
    $0.text = "용적률/건폐율"
  }
  private let ratioLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .black
  }
  
  
  // MARK: -init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  // MARK: -Action
  
  func configue(complex: Complex) {
    self.data = complex
  }
  
  // MARK: -setupUI
  
  
  private func setupUI() {
    
    contentView.addSubviews([
      collectionView,
      sectionView,
      explainView,
    ])
    
    sectionView.addSubviews([
      moldImage,
      buildDate,
      buildDateLabel,
      totalNumber,
      totalNumberLabel,
      totalCitizen,
      totalCitizenLabel,
      personalPark,
      personalParkLabel
    ])
    explainView.addSubviews([
      buildingType,
      buildingTypeLable,
      supplyType,
      supplyTypeLable,
      sizeComplex,
      sizeComplexLabel,
      complexType,
      complexTypeLabel,
      heatingSystem,
      heatingSystemLabel,
      cityGas,
      cityGasLabel,
      ratio,
      ratioLabel,
    ])
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(300)
      
    }
    sectionView.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(80)
//      $0.bottom.equalToSuperview()
    }
    moldImage.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(16)
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.centerY.equalToSuperview()
      $0.centerX.equalToSuperview()
    }
    buildDate.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(26)
      $0.top.equalToSuperview().offset(20)
    }
    buildDateLabel.snp.makeConstraints {
      $0.leading.equalTo(buildDate)
      $0.top.equalTo(buildDate.snp.bottom)
    }
    totalNumber.snp.makeConstraints {
      $0.leading.equalTo(buildDate.snp.trailing).offset(70)
      $0.top.equalTo(buildDate)
    }
    totalNumberLabel.snp.makeConstraints {
      $0.leading.equalTo(totalNumber)
      $0.top.equalTo(buildDateLabel)
    }
    totalCitizen.snp.makeConstraints {
      $0.leading.equalTo(totalNumber.snp.trailing).offset(50)
      $0.top.equalTo(buildDate)
    }
    totalCitizenLabel.snp.makeConstraints {
      $0.leading.equalTo(totalCitizen)
      $0.top.equalTo(buildDateLabel)
    }
    personalPark.snp.makeConstraints {
      $0.leading.equalTo(totalCitizen.snp.trailing).offset(72)
      $0.top.equalTo(buildDate)
    }
    personalParkLabel.snp.makeConstraints {
      $0.leading.equalTo(personalPark)
      $0.top.equalTo(buildDateLabel)
    }
    
    explainView.snp.makeConstraints {
      $0.top.equalTo(sectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(200)
      $0.bottom.equalToSuperview()
    }
    buildingType.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview().offset(26)
    }
    supplyType.snp.makeConstraints {
      $0.top.equalTo(buildingType.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    sizeComplex.snp.makeConstraints {
      $0.top.equalTo(supplyType.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    complexType.snp.makeConstraints {
      $0.top.equalTo(sizeComplex.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    heatingSystem.snp.makeConstraints {
      $0.top.equalTo(complexType.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    cityGas.snp.makeConstraints {
      $0.top.equalTo(heatingSystem.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    ratio.snp.makeConstraints {
      $0.top.equalTo(cityGas.snp.bottom).offset(10)
      $0.leading.equalTo(buildingType)
    }
    
    buildingTypeLable.snp.makeConstraints {
      $0.top.equalTo(buildingType)
      $0.leading.equalTo(buildingTypeLable.snp.trailing).offset(6)
    }
    supplyTypeLable.snp.makeConstraints {
      $0.top.equalTo(supplyType)
      $0.leading.equalTo(buildingTypeLable)
    }
    sizeComplexLabel.snp.makeConstraints {
      $0.top.equalTo(sizeComplex)
      $0.leading.equalTo(buildingTypeLable)
    }
    complexTypeLabel.snp.makeConstraints {
      $0.top.equalTo(complexType)
      $0.leading.equalTo(buildingTypeLable)
    }
    heatingSystemLabel.snp.makeConstraints {
      $0.top.equalTo(heatingSystem)
      $0.leading.equalTo(buildingTypeLable)
    }
    cityGasLabel.snp.makeConstraints {
      $0.top.equalTo(cityGas)
      $0.leading.equalTo(buildingTypeLable)
    }
    ratioLabel.snp.makeConstraints {
      $0.top.equalTo(ratio)
      $0.leading.equalTo(buildingTypeLable)
    }
  }
}

extension ComplexTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.image.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComplexCollectionViewCell.identifier, for: indexPath) as! ComplexCollectionViewCell
        let url = URL(string: "https://dabang.s3.amazonaws.com/" + (data?.image[indexPath.row] ?? ""))
        cell.imageView.kf.setImage(with: url)
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }
    
}

extension ComplexTableViewCell: UICollectionViewDelegate {
  
  
}

extension ComplexTableViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 0
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    
  }
}

