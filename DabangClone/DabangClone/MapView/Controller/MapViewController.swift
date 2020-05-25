//
//  MapViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMaps
import GooglePlaces

//CoordinateFromAddress

public let DEFAULT_CAMERA_POSITION = GMSCameraPosition(latitude: 37.5666102, longitude: 126.9783881, zoom: 18)
class POIItem: NSObject, GMUClusterItem {
  var position: CLLocationCoordinate2D
  var name: String!
  init(position: CLLocationCoordinate2D, name: String) {
    self.position = position
    self.name = name
  }
}

class BangDataMap {
  static let shared = BangDataMap()
  
  var data: [BangInCurrentMapModel] = []
  var dataOfClusteredRooms: [DabangElement] = []
}

let kClusterItemCount = 10000
let kCameraLatitude = 37.5666102
let kCameraLongitude = 126.9783881

class MapViewController: UIViewController, FilterOverlayViewControllerDelegate {
  var arrShownClusterItemName: Set<String> = []
  var pkArrInCluster: [String] = []
  weak var delegate: FilterOverlayViewControllerDelegate?
  // MARK: - Property
  private let data = BangData.shared.data
  private var clusterManager: GMUClusterManager!
  private let topView = UIView().then {
    $0.backgroundColor = .white
  }
  private let titleLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 18)
    $0.text =  ""
  }
  private let searchImage = UIImageView().then {
    $0.image = UIImage(named: "searchIcon")?.withTintColor(#colorLiteral(red: 0.6666144729, green: 0.6666962504, blue: 0.6665866375, alpha: 1))
  }
  private var mapTest = GMSMapView().then {
    $0.showsLargeContentViewer = true
    $0.isMyLocationEnabled = true
    $0.settings.compassButton = true
    $0.settings.zoomGestures = true
  }
  private let locationManager = CLLocationManager().then {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.startUpdatingLocation()
  }
  //  private var googleMaps: GMSMapView!
  var currentPlace = CLLocationCoordinate2D()
  private let myLocationButton = UIButton().then {
    $0.setImage(UIImage(named: "MyLocationImage"), for: .normal)
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let safeButton = UIButton().then {
    $0.setTitle("안전", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.backgroundColor = .white
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.borderWidth = 0.6
    $0.layer.cornerRadius = 4
  }
  private let siseButton = UIButton().then {
    $0.setTitle("시세", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.backgroundColor = .white
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.borderWidth = 0.6
    $0.layer.cornerRadius = 4
  }
  var titleString: String = "" {
    didSet {
      titleLabel.text = self.titleString
    }
  }
  private let scrollView = UIScrollView().then {
    $0.alwaysBounceHorizontal = true
    $0.backgroundColor = UIColor(named: "FilterScrollViewGray")
    $0.showsHorizontalScrollIndicator = false
  }
  
  private var stackView: UIStackView!
  private lazy var selectButtons = [
    MapFilterButton(title: "방 구조 ⌄", tag: 0).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
      
    },
    MapFilterButton(title: "거래 종류 ⌄", tag: 1).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "층 수 ⌄", tag: 2).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "추가 필터 ⌄", tag: 3).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "관리비 ⌄", tag: 4).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "가격 ⌄", tag: 5).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "관리비 ⌄", tag: 6).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "방 크기 ⌄", tag: 7).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
  ]
  private let filterButton = UIButton().then {
    $0.setImage(UIImage(named: "FilterImage"), for: .normal)
  }
  private let bottomView = UIView().then {
    $0.backgroundColor = .white
  }
  private let bottomLineView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.8697318435, green: 0.8746198416, blue: 0.8787944317, alpha: 1)
    $0.layer.cornerRadius = 4
  }
  private let allRoomButton = UIButton().then {
    $0.setTitle("전체방", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.4619160891, green: 0.4667593241, blue: 0.4709950089, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
  }
  private let apartButtun = UIButton().then {
    $0.setTitle("단지", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.4619160891, green: 0.4667593241, blue: 0.4709950089, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
  }
  private let officeButtom = UIButton().then {
    $0.setTitle("중개사무소", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.4619160891, green: 0.4667593241, blue: 0.4709950089, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
  }
  private let tableView = UITableView().then {
    $0.register(MapTableViewCell.self, forCellReuseIdentifier: MapTableViewCell.identifier)
  }
  
  var count = 0
  var searchLoad = false
  // MARK: - Gesture
  let panGesture = UIPanGestureRecognizer()
  let tapGesture = UITapGestureRecognizer()
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    tableView.dataSource = self
    tableView.delegate = self
    locationManager.delegate = self
    let coor = locationManager.location?.coordinate
    let latitude = coor?.latitude
    let longtitude = coor?.longitude
    //    mapTest.camera = GMSCameraPosition.camera(withLatitude: latitude!,
    //                                              longitude: longtitude!,
    //                                              zoom: 15)
    mapTest.camera = GMSCameraPosition.camera(withLatitude: 37.54282971056128,
                                              longitude: 127.05600935965776,
                                              zoom: 15)
    //    print(data[10].address.loadAddress)
    let iconGenerator = GMUDefaultClusterIconGenerator()
    let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
    let renderer = GMUDefaultClusterRenderer(mapView: mapTest, clusterIconGenerator: iconGenerator)
    renderer.delegate = self
    clusterManager = GMUClusterManager(map: mapTest, algorithm: algorithm, renderer: renderer)
    
    // Generate and add random items to the cluster manager.
    //    generateClusterItems()
    
    
    // Call cluster() after items have been added to perform the clustering and rendering on map.
    // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
    self.setupUI()
    // Call cluster() after items have been added to perform the clustering and rendering on map.
    // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if self.searchLoad {
      affterSearch()
      self.searchLoad.toggle()
    }
  }
  
  
  // MARK: - Action
  
  func shootSingletonToMapViewController() {
    requestRoomWhichFiltered()
    print("shootSingletonToMapViewController is run")
  }
  
  func affterSearch() {
    
    guard let tabbarframe = tabBarController?.tabBar.frame else { return }
    
    tableView.reloadData()
    let lat = BangData.shared.data[Int(pkArrInCluster[0])!].lng
    let lng =  BangData.shared.data[Int(pkArrInCluster[0])!].lat
    let cLLocation: CLLocation = CLLocation(latitude: lat, longitude: lng)
    mapTest.animate(toLocation: cLLocation.coordinate)
    mapTest.animate(toZoom: 15)
    print("check")
    self.bottomView.frame = CGRect(x: 0, y: 360, width: self.view.frame.width, height: 60 )
    self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: tabbarframe.minY - 420 )
    
  }
  @objc private func didTapFilterButton(_ sender: UIButton) {
    let vc = FilterViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  @objc private func didTapButton(_ sender: UIButton) {
    //    print("didTapButton")
    let location: CLLocation? = mapTest.myLocation
    if location != nil {
      mapTest.animate(toLocation: (location?.coordinate)!)
      mapTest.animate(toZoom: 15)
    }
    UIView.animate(withDuration: 0.1) {
      self.bottomView.frame = CGRect(x: 0, y: self.mapTest.frame.maxY, width: self.view.frame.width, height: 60 )
      self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height )
    }
    
  }
  
  @objc private func didTapAllRoomButton(_ sender: UIButton) {
    print("didTapAllRoomButton")
    
    guard let tabbarframe = tabBarController?.tabBar.frame else { return }
    
    UIView.animate(withDuration: 0.5) {
      self.bottomView.frame = CGRect(x: 0, y: 360, width: self.view.frame.width, height: 60 )
      self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: tabbarframe.minY - 420 )
    }
  }
  
  @objc private func didPanGesture(_ sender: UIPanGestureRecognizer) {
    let transition = sender.translation(in: bottomView)
    guard let tabbarframe = tabBarController?.tabBar.frame else { return }
    switch sender.state {
    case .began: break
    case .changed:
      if bottomView.frame.minY >= scrollView.frame.maxY && bottomView.frame.minY <= mapTest.frame.maxY{
        let changedY = bottomView.center.y + transition.y
        let changedTableY = tableView.center.y + transition.y
        bottomView.center = CGPoint(x: self.view.center.x, y: changedY)
        tableView.center = CGPoint(x: self.view.center.x, y: changedTableY)
        sender.setTranslation(CGPoint.zero, in: bottomView)
        sender.setTranslation(CGPoint.zero, in: tableView)
      } else {
        
      }
    case .ended:
      print(bottomView.frame.minY)
      if bottomView.frame.minY < 320 {
        UIView.animate(withDuration: 0.5) {
          self.bottomView.frame = CGRect(x: 0, y: self.scrollView.frame.maxY, width: self.view.frame.width, height: 60 )
          self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: tabbarframe.minY - self.scrollView.frame.maxY - 60 )
        }
      } else {
        UIView.animate(withDuration: 0.5) {
          self.bottomView.frame = CGRect(x: 0, y: self.mapTest.frame.maxY, width: self.view.frame.width, height: 60 )
          self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height )
        }
      }
    default:
      break
    }
  }
  
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer) {
    let vc = SearchRoomViewController()
    vc.modalPresentationStyle = .custom
    
    present(vc,animated: true,completion: nil)
  }
  // MARK: - setupUI
  private func setupUI() {
    mapTest.delegate = self
    self.myLocationButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.view.addSubviews([topView,scrollView, filterButton ,mapTest, myLocationButton,safeButton,siseButton,bottomView,tableView])
    self.topView.addSubviews([titleLabel, searchImage])
    self.bottomView.addSubviews([allRoomButton,apartButtun,officeButtom,bottomLineView])
    self.bottomView.addGestureRecognizer(panGesture)
    self.topView.addGestureRecognizer(tapGesture)
    panGesture.addTarget(self, action: #selector(didPanGesture(_:)))
    tapGesture.addTarget(self, action: #selector(didTapGesture(_:)))
    allRoomButton.addTarget(self, action: #selector(didTapAllRoomButton(_:)), for: .touchUpInside)
    filterButton.addTarget(self, action: #selector(didTapFilterButton(_:)), for: .touchUpInside)
    stackView = UIStackView(arrangedSubviews: selectButtons)
    stackView.backgroundColor = UIColor(named: "FilterScrollViewGray")
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    
    scrollView.addSubview(stackView)
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    let tabbarframe = tabBarController?.tabBar.frame
    bottomView.frame = CGRect(x: 0, y: tabbarframe!.minY - 60, width: self.view.frame.width, height: 60)
    tableView.frame = CGRect(x: 0, y: tabbarframe!.minY, width: self.view.frame.width, height: self.view.frame.height)
    topView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.115)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.bottom.equalToSuperview().inset(15)
    }
    searchImage.snp.makeConstraints {
      $0.centerY.equalTo(titleLabel.snp.centerY)
      $0.trailing.equalToSuperview().inset(15)
      $0.height.width.equalTo(18)
    }
    scrollView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.leading.equalToSuperview()
      $0.trailing.equalTo(filterButton.snp.leading)
      $0.height.equalTo(47)
    }
    filterButton.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalTo(scrollView.snp.centerY)
      $0.height.equalTo(scrollView.snp.height)
      $0.width.equalTo(51)
    }
    //    stackView.arrangedSubviews.forEach {
    //      let button = $0 as! MapFilterButton
    //      button.frame.size = CGSize(width: (15 * button.titleLabel!.text!.count) + 25, height: 35)
    //    }
    
    stackView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    }
    stackView.arrangedSubviews.forEach { v in
      let button = v as! MapFilterButton
      v.snp.makeConstraints { make in
        make.width.equalTo(15 * button.titleLabel!.text!.count + 5)
        make.height.equalTo(35)
      }
    }
    
    mapTest.snp.makeConstraints {
      $0.top.equalTo(scrollView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(guide.snp.bottom).inset(60)
    }
    myLocationButton.snp.makeConstraints {
      $0.top.equalTo(mapTest.snp.top).inset(15)
      $0.leading.equalTo(mapTest.snp.leading).offset(10)
      $0.height.width.equalTo(36)
    }
    safeButton.snp.makeConstraints {
      $0.top.equalTo(myLocationButton.snp.bottom).offset(15)
      $0.leading.equalTo(mapTest.snp.leading).offset(10)
      $0.height.width.equalTo(36)
    }
    siseButton.snp.makeConstraints {
      $0.top.equalTo(safeButton.snp.bottom).offset(15)
      $0.leading.equalTo(mapTest.snp.leading).offset(10)
      $0.height.width.equalTo(36)
    }
    //    bottomView.snp.makeConstraints {
    //      $0.leading.trailing.bottom.equalTo(guide)
    //      $0.height.equalTo(60)
    //    }
    bottomLineView.snp.makeConstraints {
      $0.height.equalTo(5)
      $0.width.equalTo(50)
      $0.top.equalToSuperview().offset(4)
      $0.centerX.equalToSuperview()
    }
    allRoomButton.snp.makeConstraints {
      $0.centerX.equalToSuperview().multipliedBy(0.3)
      $0.bottom.equalToSuperview().inset(16)
    }
    apartButtun.snp.makeConstraints {
      $0.centerX.equalToSuperview().multipliedBy(1)
      $0.bottom.equalTo(allRoomButton.snp.bottom)
    }
    officeButtom.snp.makeConstraints {
      $0.centerX.equalToSuperview().multipliedBy(1.7)
      $0.bottom.equalTo(allRoomButton.snp.bottom)
    }
    //    tableView.snp.makeConstraints {
    //      $0.leading.trailing.bottom.equalTo(guide)
    //      $0.top.equalTo(bottomView.snp.bottom)
    //      $0.height.equalTo(500)
    //    }
    
    
  }
  
  var currentCameraPosition: GMSCameraPosition?
}

extension MapViewController: GMSMapViewDelegate,GMUClusterManagerDelegate {
  
  
  
  
  func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
    print("didLongPressAt")
  }
  
  func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
    
  }
  
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    //    print("didTapAt")
    if self.bottomView.transform != .identity {
      UIView.animate(withDuration: 1) {
        self.bottomView.transform = .identity
        self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: self.view.frame.height / 2 )
      }
    } else {
      print("bottomview's transform is identity")
    }
  }
  
  @objc private func didTapDetailFilterButton(_ sender: UIButton) {
    let overlayFilterVC = FilterOverlayViewController()
    overlayFilterVC.filterTag = sender.tag
    overlayFilterVC.modalPresentationStyle = .overCurrentContext
    overlayFilterVC.modalTransitionStyle = .crossDissolve
    overlayFilterVC.delegate = self
    present(overlayFilterVC, animated: true) {
      print("presentCase0")
    }
  }
  
  //MARK: - 맵에 보이는 지역 매물 요청
  func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
    print(position.target)
    
    currentCameraPosition = position
    if FilterSingleton.shared.roomType == "" {
      requestRoomInCurrentMapWithoutFiltered(position)
    } else {
      requestRoomWhichFiltered()
    }
  }
  
  func requestRoomInCurrentMapWithoutFiltered(_ position: GMSCameraPosition) {
    APIManager.shared.getItemsInCurrentMap(km: 1, current: position.target) { result  in
      switch result {
      case .success(let data):
        
        print("success :", data.isEmpty ? "empty" : data[0])
        BangDataMap.shared.data = data
        
        DispatchQueue.main.async {
          self.addClusterToMap()
          DispatchQueue.main.async {
            self.clusterManager.cluster()
            DispatchQueue.main.async {
              self.clusterManager.setDelegate(self, mapDelegate: self)
            }
          }
        }
      case .failure(let error):
        print("failure :", error)
      }
    }
  }
  
  func requestRoomWhichFiltered() {
    APIManager.shared.getFilteredItems(salesForm__type: FilterSingleton.shared.saleType, type: FilterSingleton.shared.roomType) { response in
      switch response {
      case .success(let data):
        print("FiteringSuccess :", data.results.isEmpty ? "empty" : data.results[0])
        BangDataMap.shared.data = data.results
        DispatchQueue.main.async {
          self.addClusterToMap()
          DispatchQueue.main.async {
            self.clusterManager.cluster()
            DispatchQueue.main.async {
              self.clusterManager.setDelegate(self, mapDelegate: self)
            }
          }
        }
      case .failure(let error):
        print("filtering error" , error)
      }
    }
  }
  
  func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
    let findLocation = mapView.camera.target
    reverseGeocode(location: findLocation)
  }
  
  // [ 위경도 -> 주소 ]
  func reverseGeocode(location: CLLocationCoordinate2D) {
    let geocoder = GMSGeocoder()
    geocoder.reverseGeocodeCoordinate(location) { (respone, error) in
      if let address = respone?.firstResult() {
        self.titleString = ""
        address.lines?[0].forEach({
          if self.count == 3 {
            self.titleString.append($0)
          }
          if $0 == " " {
            self.count += 1
          }
        })
        self.count = 0
      }
    }
  }
  
  struct SameAddress {
    var loadAddress: String
    var lat: Double
    var lng: Double
  }
  
  func mapGoogleGeocoder() {
    DispatchQueue.global().async {
      var count = 0
      if BangData.shared.data.isEmpty { print("dataEmpty"); return }
      for i in 0...BangData.shared.data.count-1 {
        let address = BangData.shared.data[i].address.loadAddress
        let url = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?")
        
        let parameters: Parameters = [
          "address": address,
          "key": "AIzaSyDY0ppRrZhsxpXVHhJ4qZRWLMcpEhCjDgY"
        ]
        
        AF.request(url!, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: .none, interceptor: .none)
          .responseJSON { (response) in
            switch response.result {
            case .success(_):
              if let geocodeObjects = try? JSONDecoder().decode(Geocode.self, from: response.data!) {
                guard let location = geocodeObjects.results.first?.geometry.location else {return}
                let name = "\(BangData.shared.data[i].pk)"
                let item = POIItem(position: CLLocationCoordinate2DMake(location.lat, location.lng), name: name)
                
                DispatchQueue.main.async {
                  self.clusterManager.add(item)
                }
                print(geocodeObjects.results[0].addressComponents[0].longName)
                count += 1
                print("------성공횟수---------:", count)
              }
            case .failure(_):
              print("Error")
            }
        }//AF scope Endpoint
      } //for문 scope Endpoint
    }//DispatchQueue.global().async scope End
  } //mapGoogleGeocoder() scope End
  
  //MARK: - 맵에 클러스터 Item 추가
  func addClusterToMap() {
    self.clusterManager.clearItems()
    if BangDataMap.shared.data.isEmpty { print("dataEmpty"); return }
    for i in 0...BangDataMap.shared.data.count-1 {
      let name = "\(BangDataMap.shared.data[i].pk)"
      
      let item = POIItem(position: CLLocationCoordinate2DMake(BangDataMap.shared.data[i].lat , BangDataMap.shared.data[i].lng), name: name)
      DispatchQueue.main.async {
        if !self.arrShownClusterItemName.contains(name) {
          self.clusterManager.add(item)
          APIManager.shared.getCertainRoomData(pk: BangDataMap.shared.data[i].pk) { (result) in
            switch result {
            case .success(let eachData):
              BangDataMap.shared.dataOfClusteredRooms.insert(eachData, at: 0)
            case .failure(let error):
              print(error)
            }
          }
          self.arrShownClusterItemName.insert(name)
        }  else {
          self.clusterManager.add(item)
        }
      }
    }
  }
  
  func addClusterToMapWithFilteredData() {
    self.clusterManager.clearItems()
    if BangDataMap.shared.data.isEmpty { print("filteredData is Empty"); return }
    for i in 0...BangDataMap.shared.data.count-1 {
      let name = "\(BangDataMap.shared.data[i].pk)"
      
      let item = POIItem(position: CLLocationCoordinate2DMake(BangDataMap.shared.data[i].lat , BangDataMap.shared.data[i].lng), name: name)
      DispatchQueue.main.async {
        if !self.arrShownClusterItemName.contains(name) {
          self.clusterManager.add(item)
          APIManager.shared.getCertainRoomData(pk: BangDataMap.shared.data[i].pk) { (result) in
            switch result {
            case .success(let eachData):
              BangDataMap.shared.dataOfClusteredRooms.insert(eachData, at: 0)
            case .failure(let error):
              print(error)
            }
          }
          self.arrShownClusterItemName.insert(name)
        } else {
          self.clusterManager.add(item)
        }
      }
    }
    
    //    self.clusterManager.remove(item: )
  }
  
  // MARK: - 클러스터에 포함된 마커들의 name(pk) 값 얻기
  // Renderer delegate 설정 -> 뭉텅이 POIItem을 GMUCluster 형식으로 형변환.(그래야 내부의 마커들을 forEach로! 쪼갤 수 있음. -> forEach 사용하여 각각의 cluster item들을 다시 POIItem으로 형변환 -> 그 다음 각각의 POIItem의 name 값 추출.
  // MARK: - GMUMapViewDelegate
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    if let poiItem = marker.userData as? POIItem {
      pkArrInCluster.removeAll()
      pkArrInCluster.append(poiItem.name)
      tableView.reloadData()
    } else {
      NSLog("Did tap a normal marker")
      
      
      guard let cluster = marker.userData as? GMUCluster else { return false }
      if pkArrInCluster.count != 0 {
        pkArrInCluster.removeAll()
        cluster.items.forEach {
          guard let a = $0 as? POIItem else {return}
          pkArrInCluster.append(a.name)
        }
        tableView.reloadData()
      } else {
        cluster.items.forEach {
          guard let a = $0 as? POIItem else {return}
          pkArrInCluster.append(a.name)
        }
        tableView.reloadData()
        print(pkArrInCluster)
        
        print("didTap CLUSTER")
      }
    }
    
    let tabbarframe = tabBarController?.tabBar.frame
    
    UIView.animate(withDuration: 0.5) {
      let newCamera = GMSCameraPosition.camera(withTarget: marker.position,
                                               zoom: self.mapTest.camera.zoom)
      let update = GMSCameraUpdate.setCamera(newCamera)
      self.mapTest.moveCamera(update)
      self.bottomView.frame = CGRect(x: 0, y: 360, width: self.view.frame.width, height: 60 )
      self.tableView.frame = CGRect(x: 0, y: self.bottomView.frame.maxY, width: self.view.frame.width, height: tabbarframe!.minY - 420 )
    }
    return true
  }
  // MARK: - GMUClusterManagerDelegate
  func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
    let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                             zoom: mapTest.camera.zoom + 1)
    let update = GMSCameraUpdate.setCamera(newCamera)
    mapTest.moveCamera(update)
    
    print(cluster.items.count)
    print(cluster.items)
    
    return false
  }
  
  /// cluster manager.
  private func generateClusterItems() {
    let extent = 0.2
    for index in 1...kClusterItemCount {
      let lat = kCameraLatitude + extent * randomScale()
      let lng = kCameraLongitude + extent * randomScale()
      let name = "Item \(index)"
      let item = POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name)
      clusterManager.add(item)
    }
  }
  /// Returns a random value between -1.0 and 1.0.
  private func randomScale() -> Double {
    return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
  }
}
extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
    print("locationManagerDidPauseLocationUpdates")
  }
}

// MARK: - TableViewDataSource
extension MapViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    pkArrInCluster.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.identifier, for: indexPath) as! MapTableViewCell
    cell.configure(pk: Int(pkArrInCluster[indexPath.row]) ?? 0)
    return cell
  }
}

extension MapViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = tableView.cellForRow(at: indexPath) as! MapTableViewCell
    print(selectedCell.roomPK)
    let vc = NewMainRoomViewController()
    vc.pk = selectedCell.roomPK
    vc.setTableViewReload()
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension MapViewController: GMUClusterRendererDelegate {
  
}
