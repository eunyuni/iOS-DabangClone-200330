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

class MapViewController: UIViewController{
  // MARK: - Property
  private let topView = UIView().then {
    $0.backgroundColor = .white
  }
  private let titleLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 18)
    $0.text =  "자양동"
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
  var locationManager: CLLocationManager!
  
  //  private var googleMaps: GMSMapView!
  
  var currentPlace = CLLocationCoordinate2D()
  private let button = UIButton().then {
    $0.setTitle("자기위치로 가즈아~", for: .normal)
    $0.backgroundColor = .red
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
    MapFilterButton(title: "전체뉴스", tag: 0).then{
      $0.setTitleColor(.black, for: .normal)
    },
    MapFilterButton(title: "정책", tag: 1),
    MapFilterButton(title: "분양", tag: 2),
    MapFilterButton(title: "동향", tag: 3),
    MapFilterButton(title: "황정덕", tag: 4),
    MapFilterButton(title: "김은영", tag: 5),
    MapFilterButton(title: "정의석", tag: 6),
    MapFilterButton(title: "임성준", tag: 7),
  ]
  private let filterImage = UIImageView().then {
    $0.image = UIImage(named: "dabangProImage")
  }
  var count = 0
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.startUpdatingLocation()
    let coor = locationManager.location?.coordinate
    let latitude = coor?.latitude
    let longtitude = coor?.longitude
    print(latitude,longtitude)
    mapTest.camera = GMSCameraPosition.camera(withLatitude: latitude!,
                                              longitude: longtitude!,
                                              zoom: 15)
    setupUI()
  }
  // MARK: - Action
  @objc private func didTapButton(_ sender: UIButton) {
    print("didTapButton")
    let location: CLLocation? = mapTest.myLocation
    if location != nil {
      mapTest.animate(toLocation: (location?.coordinate)!)
      mapTest.animate(toZoom: 15)
    }
  }
  // MARK: - setupUI
  private func setupUI() {
    mapTest.delegate = self
    self.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.view.addSubviews([topView,scrollView, filterImage ,mapTest, button])
    self.topView.addSubviews([titleLabel, searchImage])
    
    stackView = UIStackView(arrangedSubviews: selectButtons)
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    scrollView.addSubview(stackView)
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
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
      $0.height.equalTo(40)
    }
    filterImage.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalTo(scrollView.snp.centerY)
      $0.width.height.equalTo(scrollView.snp.height)
    }
    stackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    }
    mapTest.snp.makeConstraints {
      $0.top.equalTo(scrollView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    button.snp.makeConstraints {
      $0.leading.top.equalTo(mapTest).inset(30)
    }
  }
}
extension MapViewController: GMSMapViewDelegate {
  //  func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
  //    let location: CLLocation? = mapTest.myLocation
  //     if location != nil {
  //         mapTest.animate(toLocation: (location?.coordinate)!)
  //     }
  //    return true
  //  }
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    print("didTapAt")
  }
  func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
    print("didChange")
  }
  
  func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
    let findLocation = mapView.camera.target
    guard let text = mapView.myLocation?.coordinate else { return }
    let duck = GMSGeocoder()
    duck.reverseGeocodeCoordinate(findLocation) { (respone, error) in
      if let address = respone?.firstResult() {
        print(address.country)
        print(address.subLocality)
        print(address.thoroughfare)
        print(address.postalCode)
        print(address.lines)
        print(address.locality)
        print(address.administrativeArea)
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
    print("mapViewDidFinishTileRendering")
  }
  func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
    print("didLongPressAt")
  }
}
extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
    print("locationManagerDidPauseLocationUpdates")
  }
}

