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

public let DEFAULT_CAMERA_POSITION = GMSCameraPosition(latitude: 37.5666102, longitude: 126.9783881, zoom: 18)
class POIItem: NSObject, GMUClusterItem {
  var position: CLLocationCoordinate2D
  var name: String!
  init(position: CLLocationCoordinate2D, name: String) {
    self.position = position
    self.name = name
  }
}
let kClusterItemCount = 10000
let kCameraLatitude = 37.5666102
let kCameraLongitude = 126.9783881
class MapViewController: UIViewController{
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
    $0.backgroundColor = .red
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
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
  }
  private var stackView: UIStackView!
  private let selectButtons = [
    MapFilterButton(title: "원룸", tag: 0).then{
      $0.setTitleColor(.black, for: .normal)
    },
    MapFilterButton(title: "가격 ⌄", tag: 1),
    MapFilterButton(title: "관리비 ⌄", tag: 2),
    MapFilterButton(title: "방 크기 ⌄", tag: 3),
    MapFilterButton(title: "층 수 ⌄", tag: 4),
    MapFilterButton(title: "방구조 ⌄", tag: 5),
    MapFilterButton(title: "추가필터 ⌄", tag: 6),
    MapFilterButton(title: "거래종류 ⌄", tag: 7),
  ]
  private let filterImage = UIImageView().then {
    $0.image = UIImage(named: "FilterImage")
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
    $0.register(RoomInfoCell.self, forCellReuseIdentifier: RoomInfoCell.identifier)
  }
  var count = 0
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    tableView.dataSource = self
    locationManager.delegate = self
    let coor = locationManager.location?.coordinate
    let latitude = coor?.latitude
    let longtitude = coor?.longitude
    mapTest.camera = GMSCameraPosition.camera(withLatitude: latitude!,
                                              longitude: longtitude!,
                                              zoom: 15)
//    print(data[10].address.loadAddress)
    let iconGenerator = GMUDefaultClusterIconGenerator()
    let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
    let renderer = GMUDefaultClusterRenderer(mapView: mapTest, clusterIconGenerator: iconGenerator)
    renderer.delegate = self
    clusterManager = GMUClusterManager(map: mapTest, algorithm: algorithm, renderer: renderer)
    // Generate and add random items to the cluster manager.
//    generateClusterItems()
    DispatchQueue.main.async {
       self.mapGoogleGeocoder()
      
      DispatchQueue.main.async {
        self.clusterManager.cluster()
        
        DispatchQueue.main.async {
                self.clusterManager.setDelegate(self, mapDelegate: self)

          DispatchQueue.main.async {
            self.setupUI()
          }
        }
      }
    }
     
      // Call cluster() after items have been added to perform the clustering and rendering on map.
      
      // Register self to listen to both GMUClusterManagerDelegate and GMSMapViewDelegate events.
      
      
      
    
  }
  // MARK: - Action
  @objc private func didTapButton(_ sender: UIButton) {
//    print("didTapButton")
    let location: CLLocation? = mapTest.myLocation
    if location != nil {
      mapTest.animate(toLocation: (location?.coordinate)!)
      mapTest.animate(toZoom: 15)
    }
  }
  // MARK: - setupUI
  private func setupUI() {
    mapTest.delegate = self
    self.myLocationButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.view.addSubviews([topView,bottomView,scrollView, filterImage ,mapTest, myLocationButton,safeButton,siseButton])
    self.topView.addSubviews([titleLabel, searchImage])
    self.bottomView.addSubviews([allRoomButton,apartButtun,officeButtom,bottomLineView])
    stackView = UIStackView(arrangedSubviews: selectButtons)
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    scrollView.addSubview(stackView)
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
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
      $0.trailing.equalTo(filterImage.snp.leading)
      $0.height.equalTo(47)
    }
    filterImage.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalTo(scrollView.snp.centerY)
      $0.height.equalTo(scrollView.snp.height)
      $0.width.equalTo(51)
    }
    stackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    }
    mapTest.snp.makeConstraints {
      $0.top.equalTo(scrollView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(bottomView.snp.top)
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
    bottomView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalTo(guide)
      $0.height.equalTo(60)
    }
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
  }
}

extension MapViewController: GMSMapViewDelegate,GMUClusterManagerDelegate {
  func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
    print("didLongPressAt")
  }
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    print("didTapAt")
  }
  func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
//    print("didChange")
  }
  func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
    let findLocation = mapView.camera.target
    guard let text = mapView.myLocation?.coordinate else { return }
    let duck = GMSGeocoder()
    duck.reverseGeocodeCoordinate(findLocation) { (respone, error) in
      if let address = respone?.firstResult() {
//        print(address.country)
//        print(address.subLocality)
//        print(address.thoroughfare)
//        print(address.postalCode)
//        print(address.lines)
//        print(address.locality)
//        print(address.administrativeArea)
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
//    let marker = CustomMarker(labelText: "25")
//    marker.position = mapView.camera.target
//    marker.map = mapView //your mapView object
//    print("mapViewDidFinishTileRendering")
  }
  
  
  func mapGoogleGeocoder() {
//    var items: [GMUClusterItem] = []
    DispatchQueue.global().async {
      for i in 0...BangData.shared.data.count-1 {
      let address = BangData.shared.data[i].address.loadAddress
      let geoCoder = CLGeocoder()
      geoCoder.geocodeAddressString(address) { (placemarks, error) in
          guard
              let placemarks = placemarks,
              let location = placemarks.first?.location
            
          else {
              // handle no location found
            print("실패주소 :", address)
              return
          }
        print("성공주소 :", address)
        let name = "\(BangData.shared.data[i].pk)"
        let item = POIItem(position: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), name: name)
//        items.append(item)
        DispatchQueue.main.async {
                    self.clusterManager.add(item)
//          self.clusterManager.add(items)

        }
        
        print("mapGoogleGeocoder : ", location.coordinate)
          // Use your location
        }
      }
    }
    
  }
  // MARK: - 클러스터에 포함된 마커들의 name(pk) 값 얻기
  // Renderer delegate 설정 -> 뭉텅이 POIItem을 GMUCluster 형식으로 형변환.(그래야 내부의 마커들을 forEach로 쪼갤 수 있음. -> forEach 사용하여 각각의 cluster item들을 다시 POIItem으로 형변환 -> 그 다음 각각의 POIItem의 name 값 추출.
  // MARK: - GMUMapViewDelegate
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    if let poiItem = marker.userData as? POIItem {
      NSLog("Did tap marker for cluster item \(poiItem.name)")
    } else {
      NSLog("Did tap a normal marker")
    }
    
    guard let cluster = marker.userData as? GMUCluster else { return false }
    cluster.items.forEach {
      guard let a = $0 as? POIItem else {return}
      print(a.name)
    }
    print(cluster.items)
    
    print("didTap CLUSTER")
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
    0
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoCell.identifier, for: indexPath) as! RoomInfoCell
    return cell
  }
}

extension MapViewController: GMUClusterRendererDelegate {
  
}
