//
//  MainRoomSecondTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MainRoomSecondTableViewCell: UITableViewCell {
  
  static let identifier = "SecondTableViewCell"
  
  let roomData = findRoomDataFromRoomID(rooms, roomID: 1)
  
  var bangData = BangDataMap.shared.dataOfClusteredRooms[0]
  
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .vertical
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
    $0.isUserInteractionEnabled = false
    $0.backgroundColor = .white
    $0.register(MainRoomSecondCollectionViewCell.self, forCellWithReuseIdentifier: MainRoomSecondCollectionViewCell.identifier)
    $0.dataSource = self
    $0.delegate = self
  }
  
  //  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  let optionLabelView = UIView().then {
    $0.backgroundColor = .white
  }
  let optionLabel = UILabel().then {
    $0.text = "옵션"
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let bottomWhiteView = UIView().then {
    $0.backgroundColor = .white
  }
  let separatorBar = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let grayShadow = UIView().then {
    $0.backgroundColor = .lightGray
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    
    contentView.addSubviews([optionLabelView, collectionView, bottomWhiteView,separatorBar, grayShadow])
    optionLabelView.addSubviews([optionLabel])
    setupConstraints()
  }
  
  private func setupConstraints() {
    
    optionLabelView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview()
      $0.height.equalTo(65)
    }
    optionLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(25)
      $0.leading.equalToSuperview().offset(20)
    }
    if bangData.optionSet.count <= 5 {
      collectionView.snp.makeConstraints {
        $0.top.equalTo(optionLabelView.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(100)
      }
    } else {
      collectionView.snp.makeConstraints {
        $0.top.equalTo(optionLabelView.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(200)
      }
    }
    bottomWhiteView.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(20)
    }
    separatorBar.backgroundColor = UIColor(named: "SegmentBackground")

    separatorBar.snp.makeConstraints {
      $0.top.equalTo(bottomWhiteView.snp.bottom)
      $0.leading.bottom.trailing.equalToSuperview()
      $0.height.equalTo(8)
    }
    grayShadow.snp.makeConstraints {
      $0.top.equalTo(separatorBar)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(1)
    }
    
//    contentView.snp.makeConstraints {
//    }
    contentView.clipsToBounds = false
  }
  
  func reloadCollectionView(pk: Int) {
    var bangDataArr = BangDataMap.shared.dataOfClusteredRooms.filter {
      $0.pk == pk
    }
    if bangDataArr.isEmpty {
      APIManager.shared.getCertainRoomData(pk: pk) { (result) in
      switch result {
      case .success(let eachData):
      bangDataArr.append(eachData)
      case .failure(let error):
        print(error)
      }
      }
    } else {
      bangData = bangDataArr[0]
    }
    
  }
  
}

extension MainRoomSecondTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bangData.optionSet.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainRoomSecondCollectionViewCell.identifier, for: indexPath) as! MainRoomSecondCollectionViewCell
    let imageURL = URL(string: bangData.optionSet[indexPath.row].imageName())
    print("--------------------Second CollectionView ----------------")
//    let imageURL = URL(string: roomData.addInfo.option[indexPath.row].imageName())
    print(bangData.optionSet[indexPath.row].imageName())
      let image = UIView(SVGURL: imageURL!)
        image.frame = cell.imageView.frame
        image.center = cell.imageView.center
        cell.imageView.addSubview(image)
        cell.imageView.contentMode = .scaleAspectFit
    cell.optionLabel.text = bangData.optionSet[indexPath.row].rawValue
//    print(bangData.optionSet[indexPath.row].rawValue)
    return cell
  }
}

extension MainRoomSecondTableViewCell: UICollectionViewDelegate {
  
}

extension MainRoomSecondTableViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if bangData.optionSet.count <= 5 {
      return CGSize(width: collectionView.frame.width/5 - 4, height: collectionView.frame.height)
    } else {
      return CGSize(width: collectionView.frame.width/5 - 4, height: collectionView.frame.height/2)
    }
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
    return UIEdgeInsets(top: margin, left: 8, bottom: margin, right: 8)
  }
}
