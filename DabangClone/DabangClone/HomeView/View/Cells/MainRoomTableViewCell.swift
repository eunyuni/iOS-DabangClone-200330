//
//  MainRoomTableViewCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/07.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SwiftSVG

class MainRoomTableViewCell: UITableViewCell {
  static let identifier = "MainRoomTableViewCell"
  
  let roomData = findRoomDataFromRoomID(rooms, roomID: 1)
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  let optionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewCenteredFlowLayout()).then {
    $0.isPagingEnabled = false
  $0.isUserInteractionEnabled = false
  }
  
  var optionArr = ["풀옵션", "빌트인", "반려동물", "보안/안전", "전세자금대출", "주차", "개별난방"]
  
  let titleView = UIView().then {
    $0.backgroundColor = .white
  }
  let titleLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
  }
  let subtitleLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textColor = .gray
  }
  let bezel1 = Graybezel()
  let roomStyleImageView = UIImageView().then {
    $0.image = UIImage(named: "RoomStyleImage")
  }
  let roomStyleLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
    $0.textColor = .black
  }
  let areaImageView = UIImageView().then {
    $0.image = UIImage(named: "AreaImage")
  }
  let areaLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
    $0.textColor = .black
  }
  let floorImageView = UIImageView().then {
    $0.image = UIImage(named: "FloorImage")
  }
  let floorLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
    $0.textColor = .black
  }
  let adminCostImageView = UIImageView().then {
    $0.image = UIImage(named: "AdminCostImage")
  }
  let adminCostLabel = UILabel().then {
    $0.text = ""
    $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
    $0.textColor = .black
  }
  let bezel2 = Graybezel()
  let separatorBar = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let grayShadow = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let costView = UIView().then {
    $0.backgroundColor = .white
  }
  let costCellImageView = UIImageView().then {
    $0.image = UIImage(named: "CostCellImage")
    $0.isHidden = true
    
  }
  let costInfoLabel = UILabel().then {
    $0.text = "가격정보"
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let separatorBar2 = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let grayShadow2 = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let detailInfoView = UIView().then {
    $0.backgroundColor = .white
  }
  let detailInfoImageView = UIImageView().then {
    $0.image = UIImage(named: "DetailInfoImage")
    $0.isHidden = true
  }
  let detailInfoLabel = UILabel().then {
    $0.text = "상세정보"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 22, weight: .bold)
  }
  let separatorBar3 = UIView().then {
    $0.backgroundColor = .lightGray
  }
  let grayShadow3 = UIView().then {
    $0.backgroundColor = .lightGray
  }
  
  let costStackView = CostInfoStackView()
  
  let detailInfoStackView = DetailInfoStackView()
  
  var bangData = BangData.shared.data[7]
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  
  func setupUI(pk: Int) {
    let bangDataArr = BangData.shared.data.filter {
      $0.pk == pk
    }
    bangData = bangDataArr[0]
    
    
    if bangData.salesForm.type == .월세 {
      
      titleLabel.text = "\(bangData.salesForm.type) \(bangData.salesForm.depositChar)/\(bangData.salesForm.monthlyChar)"
    } else if bangData.salesForm.type == .매매 || bangData.salesForm.type == .전세 {
      titleLabel.text = "\(bangData.salesForm.type) \(bangData.salesForm.depositChar)"
    }
    let cost = "\(bangData.salesForm.depositChar)/\(bangData.salesForm.monthlyChar)"
    
    subtitleLabel.text = "\(bangData.dabangDescription)"
    roomStyleLabel.text = "\(bangData.type)"
    let start = bangData.areaChar.index(bangData.areaChar.startIndex, offsetBy: 0)
    let end = bangData.areaChar.index(bangData.areaChar.firstIndex(of: " ") ?? bangData.areaChar.endIndex, offsetBy: 0)
    let range = start..<end
    let mySubstring = bangData.areaChar[range]
    areaLabel.text = "\(String(mySubstring))m²"
    floorLabel.text = "\(bangData.floor)"
    if floorLabel.text?.last == " " {
      floorLabel.text?.removeLast()
    }
    
    if roomData.baseInfo.adminCost {
      adminCostLabel.text = "있음"
    } else {
      adminCostLabel.text = "없음"
    }
    
    contentView.addSubviews([titleView, separatorBar, grayShadow, costView, separatorBar2, grayShadow2, detailInfoView, separatorBar3, grayShadow3,])
    titleView.addSubviews([titleLabel, subtitleLabel, bezel1, roomStyleImageView, areaImageView, floorImageView, adminCostImageView, roomStyleLabel, areaLabel, floorLabel, adminCostLabel, bezel2,])
    costView.addSubviews([costCellImageView, costInfoLabel, costStackView])
    
    
    
    var shortRental = ""
    if (bangData.shortRent ?? false) { shortRental = "가능" } else { shortRental = "불가능" }
    
    costStackView.configure(salesFormType: "\(bangData.salesForm.type)",titles: [cost,  adminCostLabel.text!, "\(bangData.parkingDetail)", shortRental,"\(bangData.salesForm.type)\n", "\(bangData.salesForm.monthlyChar) + ɑ"])
    
    
    var builtIn = ""
    if bangData.builtIn { builtIn = "있음" } else { builtIn = "없음"}
    var elevator = ""
    if bangData.elevator { elevator = "있음" } else { elevator = "없음" }
    var pet = ""
    if bangData.pet { pet = "가능" } else { pet = "불가능"}
    var balcony = ""
    if bangData.veranda { balcony = "있음" } else { balcony = "없음" }
    var charterLoan = ""
    if bangData.depositLoan { charterLoan = "가능" } else { charterLoan = "불가능" }
    detailInfoView.addSubviews([detailInfoLabel,detailInfoImageView, detailInfoStackView])
    detailInfoStackView.configure(titles: ["\(bangData.type)", bangData.floor + "/ \(bangData.totalFloor)", "\(bangData.areaChar)", bangData.heatingType.rawValue, builtIn, elevator, pet, balcony, charterLoan, bangData.moveInChar.rawValue])
    
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    setupCollectionView()
    
    titleView.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      if optionArr.count <= 5 {
      $0.height.equalTo(270)
      } else {
        $0.height.equalTo(302)
      }
    }
    
    titleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(32)
    }
    
    subtitleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(titleLabel.snp.bottom).offset(8)
    }
    
    bezel1.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(subtitleLabel.snp.bottom).offset(15)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
      $0.height.equalTo(0.5)
    }
    
    roomStyleImageView.snp.makeConstraints {
      $0.top.equalTo(bezel1).offset(18)
      $0.centerX.equalTo(snp.trailing).multipliedBy(0.154)
      $0.width.height.equalTo(snp.width).multipliedBy(0.08)
    }
    areaImageView.snp.makeConstraints {
      $0.top.equalTo(bezel1).offset(18)
      $0.centerX.equalTo(snp.trailing).multipliedBy(0.381)
      $0.width.height.equalTo(snp.width).multipliedBy(0.08)
    }
    floorImageView.snp.makeConstraints {
      $0.top.equalTo(bezel1).offset(18)
      $0.centerX.equalTo(snp.trailing).multipliedBy(0.613)
      $0.width.height.equalTo(snp.width).multipliedBy(0.08)
    }
    adminCostImageView.snp.makeConstraints {
      $0.top.equalTo(bezel1).offset(18)
      $0.centerX.equalTo(snp.trailing).multipliedBy(0.845)
      $0.width.height.equalTo(snp.width).multipliedBy(0.08)
    }
    roomStyleLabel.snp.makeConstraints {
      $0.top.equalTo(roomStyleImageView.snp.bottom).offset(10)
      $0.centerX.equalTo(roomStyleImageView)
    }
    
    areaLabel.snp.makeConstraints {
      $0.top.equalTo(roomStyleLabel)
      $0.centerX.equalTo(areaImageView)
    }
    
    floorLabel.snp.makeConstraints {
      $0.top.equalTo(roomStyleLabel)
      $0.centerX.equalTo(floorImageView)
    }
    
    adminCostLabel.snp.makeConstraints {
      $0.top.equalTo(roomStyleLabel)
      $0.centerX.equalTo(adminCostImageView)
    }
    
    bezel2.snp.makeConstraints {
      $0.top.equalTo(roomStyleLabel.snp.bottom).offset(18)
      $0.centerX.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
      $0.height.equalTo(0.5)
    }
    
    separatorBar.snp.makeConstraints {
      $0.top.equalTo(titleView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(8)
    }
    separatorBar.backgroundColor = UIColor(named: "SegmentBackground")
    grayShadow.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(separatorBar)
      $0.height.equalTo(0.5)
    }
    costView.snp.makeConstraints {
      $0.top.equalTo(separatorBar.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(380)
    }
    
    //StackView Cost
    costStackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 65, left: 20, bottom: 30, right: 20))
    }
    
    costInfoLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(25)
      $0.leading.equalToSuperview().offset(20)
    }
    
    costCellImageView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 65, left: 20, bottom: 30, right: 20))
    }
    
    separatorBar2.snp.makeConstraints {
      $0.top.equalTo(costView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(8)
    }
    separatorBar2.backgroundColor = UIColor(named: "SegmentBackground")
    
    grayShadow2.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(separatorBar2)
      $0.height.equalTo(0.5)
    }
    
    detailInfoView.snp.makeConstraints {
      $0.top.equalTo(separatorBar2.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(540)
    }
    
    detailInfoLabel.snp.makeConstraints {
      $0.top.equalTo(detailInfoView).offset(25)
      $0.leading.equalToSuperview().offset(20)
    }
    
    detailInfoImageView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 65, left: 20, bottom: 30, right: 20))
    }
    detailInfoStackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 65, left: 20, bottom: 30, right: 20))
    }
    
    separatorBar3.snp.makeConstraints {
      $0.top.equalTo(detailInfoView.snp.bottom)
      $0.leading.bottom.trailing.equalToSuperview()
      $0.height.equalTo(8)
    }
    separatorBar3.backgroundColor = UIColor(named: "SegmentBackground")
    
    grayShadow3.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(separatorBar3)
      $0.height.equalTo(0.5)
    }
    contentView.clipsToBounds = true
  }
  
  func computingCellHeight() {
    print(collectionView.frame.height + titleView.frame.height + costView.frame.height + separatorBar.frame.height)
  }
  
  private func setupCollectionView() {
    setupFlowLayout()
    //    collectionView.isUserInteractionEnabled = true
    collectionView.isPagingEnabled = true
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionView.register(MainRoomCollectionViewCell.self, forCellWithReuseIdentifier: MainRoomCollectionViewCell.identifier)
    contentView.addSubview(collectionView)
    
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(NewMainRoomViewController.frammm.height/3)
    }
    collectionView.reloadData()
    
    optionCollectionView.backgroundColor = .white
    optionCollectionView.isPagingEnabled = false
    optionCollectionView.dataSource = self
    optionCollectionView.delegate = self
    optionCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    optionCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Option")
    contentView.addSubview(optionCollectionView)
    optionCollectionView.snp.makeConstraints {
      $0.top.equalTo(bezel2.snp.bottom).offset(20)
      $0.leading.trailing.equalToSuperview()
      if optionArr.count <= 5 {
      $0.height.equalTo(25)
      } else {
        $0.height.equalTo(57)
      }
    }
    optionCollectionView.reloadData()
  }
  
  private func setupFlowLayout() {
    guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
    //    flowLayout.itemSize = CGSize(width: NewMainRoomViewController.frammm.width, height: NewMainRoomViewController.frammm.height/3)
    //    flowLayout.minimumLineSpacing = 0
    //    flowLayout.minimumInteritemSpacing = 0
    //    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    flowLayout.scrollDirection = .horizontal
  }
}

extension MainRoomTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == self.collectionView {
      
      return bangData.postimage.count
    } else {
      return bangData.optionSet.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == self.collectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainRoomCollectionViewCell.identifier, for: indexPath) as! MainRoomCollectionViewCell
      let url = URL(string: "https://wpsdabangapi.s3.amazonaws.com/\(bangData.postimage[indexPath.row])")
      cell.imageView.kf.setImage(with: url)
      cell.imageView.contentMode = .scaleAspectFill
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Option", for: indexPath)
      cell.contentView.backgroundColor = UIColor(named: "CostCellColor")
      let label = UILabel().then {
        $0.text = bangData.optionSet[indexPath.row].rawValue
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
      }
      print(bangData.optionSet[indexPath.row])
      cell.contentView.addSubview(label)
      label.snp.makeConstraints {
        $0.center.equalToSuperview()
      }
      return cell
    }
  }
  
}

extension MainRoomTableViewCell: UICollectionViewDelegate {
  
  
}

extension MainRoomTableViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == self.collectionView {
      return CGSize(width: NewMainRoomViewController.frammm.width, height: NewMainRoomViewController.frammm.height/3)
    } else {
      if bangData.optionSet.count == 3 {
        return CGSize(width: 50, height: 25)
      } else if bangData.optionSet.count == 4 {
        return CGSize(width: 60, height: 25)
      } else if bangData.optionSet.count == 5 {
        return CGSize(width: 70, height: 25)
      } else if bangData.optionSet.count == 2 {
        return CGSize(width: 40, height: 25)
      } else if bangData.optionSet.count == 6 {
        return CGSize(width: 80, height: 25)
      } else {
        return CGSize(width: 50, height: 25)
      }
    }
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == self.collectionView {
      return 0
    } else {
      return 7
    }
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == self.collectionView {
      return 0
    } else {
      return 7
    }
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 0
    if collectionView == self.collectionView {
      return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    } else {
      return UIEdgeInsets(top: margin, left: 18, bottom: margin, right: 18)
    }
  }
}


