//
//  HomeTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/03.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
  func presentController(indexPath: IndexPath) -> Void
  func presentWebController(url: String) -> Void
  func presentSaleController(id: Int) -> Void
  func presentMapController() -> Void
}


// 메인 페이지
class HomeTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "HomeTableViewCell"
  // MARK: - Delegate
  weak var delegate: HomeTableViewCellDelegate?
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
    $0.backgroundColor = .white
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
    $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    $0.register(HomeInterestCollectionViewCell.self, forCellWithReuseIdentifier: HomeInterestCollectionViewCell.identifier)
    $0.register(HomeSaleCollectionViewCell.self, forCellWithReuseIdentifier: HomeSaleCollectionViewCell.identifier)
    $0.register(HomeRecommendedCollectionViewCell.self, forCellWithReuseIdentifier: HomeRecommendedCollectionViewCell.identifier)
  }
  
  private let button = UIButton().then {
    $0.isHidden = true
    $0.backgroundColor = .red
  }
  private var indexPath: IndexPath!
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue(data: HomeData, indexPath: IndexPath) {
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
    self.indexPath = indexPath
  }
  
  @objc private func didTapButton(_sender : UIButton) {
    print(self.indexPath.row)
    delegate?.presentController(indexPath: indexPath)
    switch indexPath.row {
    case 0: break
    case 1: break
    case 2: break
    default:
      break
    }
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
    print(indexPath.row)
    switch self.indexPath.row {
    case 0:
      return interestRoomDatas.count
    case 1:
      return interestApartDatas.count
    case 2:
      return saleHomeDatas.count
    case 3:
      return contentDatas.count
    default:
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch self.indexPath.row {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeInterestCollectionViewCell.identifier, for: indexPath ) as! HomeInterestCollectionViewCell
      cell.configue(data: interestRoomDatas[indexPath.item])
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeInterestCollectionViewCell.identifier, for: indexPath ) as! HomeInterestCollectionViewCell
      cell.configue(data: interestApartDatas[indexPath.item])
      return cell
    case 2:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSaleCollectionViewCell.identifier, for: indexPath ) as! HomeSaleCollectionViewCell
      cell.configue(data: saleHomeDatas[indexPath.item])
      return cell
    case 3:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendedCollectionViewCell.identifier, for: indexPath ) as! HomeRecommendedCollectionViewCell
      cell.configue(data: contentDatas[indexPath.item])
      return cell
    default:
      return UICollectionViewCell()
    }
    
  }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if self.indexPath.row == 3 {
      return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height - 10)
    } else {
      return CGSize(width: collectionView.frame.width * 3 / 5, height: collectionView.frame.height - 10)
    }
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
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch self.indexPath.row {
    case 0:
      delegate?.presentMapController()
    case 2:
      print("check")
      delegate?.presentSaleController(id: indexPath.item)
    case 3:
      delegate?.presentWebController(url: contentDatas[indexPath.item].url)
    default:
      break
    }
  }
}
