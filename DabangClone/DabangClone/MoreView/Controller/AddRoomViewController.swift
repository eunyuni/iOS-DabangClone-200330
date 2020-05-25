//
//  AddRoomViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class AddRoomSingleton {
  static let shared = AddRoomSingleton()
  
//  var roomDataForMake: DabangElement = DabangElement(pk: 0, broker: Broker(pk: 0, companyName: "", address: "", managerName: "", tel: "", image: "", companyNumber: "", brokerage: Brokerage.제11680201900149, dabangCreatedAt: "", successCount: ""), type: BuildingTypeEnum.쓰리룸, dabangDescription: "", address: Address(loadAddress: "", detailAddress: .none), lng: 0, lat: 0, salesForm: SalesForm(type: SalesFormType.월세, depositChar: "", monthlyChar: "", depositInt: 0, monthlyInt: 0), floor: "", totalFloor: "", areaChar: "", supplyAreaInt: 0, supplyAreaChar: "", shortRent: false, managementSet: [""], parkingDetail: ParkingDetail.가능무료, parkingtf: false, livingExpenses: "", livingExpensesDetail: "", moveInChar: MoveInChar.날짜협의, moveInDate: .none, optionSet: [.가스레인지], heatingType: .개별난방, pet: false, elevator: true, builtIn: false, veranda: false, depositLoan: false, totalCitizen: "", totalPark: .none, complete: .none, securitySafetySet: [SecuritySafetySet.cctv], postimage: [""], complex: nil)
}
class AddRoomViewController: UIViewController {

  let vc = RoomSellScrollViewController()
  // MARK: - Property
  private let potoView = UIImageView().then {
    $0.backgroundColor = .red
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
    
  }
  //    .then {
  //    $0.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
  //    $0.minimumInteritemSpacing = 0
  //    $0.minimumLineSpacing = 0
  //    $0.itemSize = CGSize(width: 150, height: 150)
  // 헤더값 주기
  //    $0.headerReferenceSize = CGSize(width: 60, height: 60)
  //    $0.sectionHeadersPinToVisibleBounds = true
  //    $0.footerReferenceSize = CGSize(width: 50, height: 50)
  //  }
  private lazy var potoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .red
    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    $0.bounces = false
    $0.register(AddRoomCollectionViewCell.self, forCellWithReuseIdentifier: AddRoomCollectionViewCell.identifier)
  }
  private let addressView = AddRoomTitleView().then {
    $0.configure(title: "주소", Image: "addressIcon")
  }
  private let basicInfomationView = AddRoomTitleView().then {
    $0.configure(title: "기본 정보", Image: "addressIcon")
  }
  private let additionalView = AddRoomTitleView().then {
    $0.configure(title: "추가 정보", Image: "addressIcon")
  }
  private let explanationView = AddRoomTitleView().then {
    $0.configure(title: "설명", Image: "addressIcon")
  }
  private let emptyView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
  }
  private let imageView = UIImageView().then {
    $0.image = UIImage(named: "potoAdd")
  }
  private let potoLabel = UILabel().then {
    $0.text = "사진추가"
    $0.textColor = #colorLiteral(red: 0.4352585971, green: 0.4353140593, blue: 0.4352396429, alpha: 1)
    $0.font = .systemFont(ofSize: 13)
  }
  private var uiImages: [UIImage] = [] {
    didSet {
      RoomForSale.shared.images = uiImages
    }
  }
  private let addressTapGesture = UITapGestureRecognizer()
  private let basicInfoTapGesture = UITapGestureRecognizer()
  private let additionalTapGesture = UITapGestureRecognizer()
  private let explanationTapGesture = UITapGestureRecognizer()
  private let emptyViewTapGesture = UITapGestureRecognizer()
  private let completionButton = UIButton().then {
    $0.setTitle("방 내놓기 완료", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.5889170766, green: 0.7428973317, blue: 1, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.addTarget(self, action: #selector(didTapCompletionButton(_:)), for: .touchUpInside)
    $0.backgroundColor = #colorLiteral(red: 0.2344230413, green: 0.5276803374, blue: 1, alpha: 1)
  }
  private let linViews: [UIView] = [
    UIView().then({
      $0.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
    }),
    UIView().then({
      $0.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
    }),
    UIView().then({
      $0.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
    }),
    UIView().then({
      $0.backgroundColor = #colorLiteral(red: 0.9254193306, green: 0.9255301356, blue: 0.9253814816, alpha: 1)
    }),
  ]
  
  
  // MARK: -Lift cycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.potoCollectionView.reloadData()
    checkRoomForSale()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "방 내농기"
    setupUI()
  }
  

  // MARK: - Action
  private func checkRoomForSale() {
    let roomForSaleData = RoomForSale.shared
    if roomForSaleData.roomData.loadAddress != nil {
      addressView.setComplete()
    }
  }
  @objc private func didTapCompletionButton(_ sender: UIButton) {
    
  }
  @objc private func didTapAddressGesture(_ sender: UITapGestureRecognizer) {
    vc.pageNum = 0
    navigationController?.pushViewController(vc, animated: true)
    print("didTap")
  }
  @objc private func didTapBasicInfoGesture(_ sender: UITapGestureRecognizer) {
    vc.pageNum = 1
    navigationController?.pushViewController(vc, animated: true)
    print("didTap")
  }
  @objc private func didTapAdditionalGesture(_ sender: UITapGestureRecognizer) {
    vc.pageNum = 2
    navigationController?.pushViewController(vc, animated: true)
    print("didTap")
  }
  @objc private func didTapExplanationGesture(_ sender: UITapGestureRecognizer) {
    vc.pageNum = 3
    navigationController?.pushViewController(vc, animated: true)
    print("didTap")
  }
  @objc private func didTapEmptyGesture(_ sender: UITapGestureRecognizer) {
    let vc = AddPotoViewController()
    vc.delegate = self
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
  }
  
  // MARK: - SetupUI
  private func setupUI() {
    self.view.backgroundColor = #colorLiteral(red: 0.9528682828, green: 0.9529824853, blue: 0.9528294206, alpha: 1)
    addressTapGesture.addTarget(self, action: #selector(didTapAddressGesture(_:)))
    basicInfoTapGesture.addTarget(self, action: #selector(didTapBasicInfoGesture(_:)))
    additionalTapGesture.addTarget(self, action: #selector(didTapAdditionalGesture(_:)))
    explanationTapGesture.addTarget(self, action: #selector(didTapExplanationGesture(_:)))
    emptyViewTapGesture.addTarget(self, action: #selector(didTapEmptyGesture(_:)))
    addressView.addGestureRecognizer(addressTapGesture)
    basicInfomationView.addGestureRecognizer(basicInfoTapGesture)
    additionalView.addGestureRecognizer(additionalTapGesture)
    explanationView.addGestureRecognizer(explanationTapGesture)
    emptyView.addGestureRecognizer(emptyViewTapGesture)
    self.view.addSubviews([addressView, basicInfomationView, additionalView, explanationView, completionButton, potoCollectionView, emptyView])
    self.linViews.forEach {
      self.view.addSubview($0)
    }
    emptyView.addSubviews([potoLabel,imageView])
    setupConstraints()
  }
  
  // MARK: - Layout
  private func setupConstraints() {
    let guide = self.view.safeAreaLayoutGuide
    potoCollectionView.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.367)
    }
    emptyView.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.367)
    }
    addressView.snp.makeConstraints {
      $0.top.equalTo(potoCollectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.0625)
    }
    linViews[0].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(addressView.snp.bottom)
    }
    basicInfomationView.snp.makeConstraints {
      $0.top.equalTo(linViews[0].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.0625)
    }
    linViews[1].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(basicInfomationView.snp.bottom)
    }
    additionalView.snp.makeConstraints {
      $0.top.equalTo(linViews[1].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.0625)
    }
    linViews[2].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(additionalView.snp.bottom)
    }
    explanationView.snp.makeConstraints {
      $0.top.equalTo(linViews[2].snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.0625)
    }
    linViews[3].snp.makeConstraints {
      $0.leading.equalToSuperview().offset(8)
      $0.trailing.equalToSuperview().offset(-8)
      $0.height.equalTo(1)
      $0.top.equalTo(explanationView.snp.bottom)
    }
    completionButton.snp.makeConstraints {
      $0.leading.bottom.trailing.equalToSuperview()
      $0.height.equalTo(self.view.snp.height).multipliedBy(0.0733)
    }
    
    imageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(emptyView.snp.centerY)
      $0.width.height.equalTo(30)
    }
    
    potoLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(emptyView.snp.centerY)
    }
  }
  
}

extension AddRoomViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if RoomForSale.shared.images.isEmpty {
      emptyView.isHidden = false
      return RoomForSale.shared.images.count
    } else {
      emptyView.isHidden = true
      return RoomForSale.shared.images.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddRoomCollectionViewCell.identifier, for: indexPath) as! AddRoomCollectionViewCell
    cell.configue(image: RoomForSale.shared.images[indexPath.item])
    return cell
  }
}

extension AddRoomViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.4)
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


extension AddRoomViewController: AddPotoViewControllerDelegate {
  func getImage(images: [UIImage]) {
    self.uiImages = images
  }
  
  
}
