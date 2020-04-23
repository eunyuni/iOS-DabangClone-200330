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

public let DEFAULT_CAMERA_POSITION = GMSCameraPosition(latitude: 37.5666102, longitude: 126.9783881, zoom: 18)

class MapViewController: UIViewController{
  // MARK: - Property
  
  private var mapTest = GMSMapView.map(withFrame: .zero, camera: DEFAULT_CAMERA_POSITION).then {
    $0.showsLargeContentViewer = true
    $0.settings.myLocationButton = true
    $0.settings.indoorPicker = true
    $0.settings.compassButton = true
  }
  var locationManager: CLLocationManager!
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
    GMSCameraPosition.camera(withLatitude: -33,
    longitude: 151,
    zoom: 6,
    bearing: 270,
    viewingAngle: 45)
    setupUI()
  }
  // MARK: - Action
  // MARK: - setupUI
  private func setupUI() {
    mapTest.delegate = self
    self.view.addSubviews([mapTest])
    // Creates a marker in the center of the map.
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: 37.5666102, longitude: 126.9783881)
    marker.title = "Sydney"
    marker.snippet = "Australia"
    marker.map = mapTest
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    mapTest.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
    }
  }
}
extension MapViewController: GMSMapViewDelegate {
}
extension MapViewController: CLLocationManagerDelegate {
}
