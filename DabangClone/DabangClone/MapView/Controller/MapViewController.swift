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
  
  private var mapTest = GMSMapView().then {
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
    let latitude = coor?.latitude ?? 37.5666102
    let longtitude = coor?.longitude ?? 126.9783881
        print(latitude,longtitude)
    mapTest.camera = GMSCameraPosition.camera(withLatitude: 37.5666102,
                                              longitude: 126.9783881,
                                              zoom: 18)
    setupUI()
  }
  // MARK: - Action
  // MARK: - setupUI
  private func setupUI() {
    mapTest.delegate = self
    self.view.addSubviews([mapTest])
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    mapTest.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
extension MapViewController: GMSMapViewDelegate {
}
extension MapViewController: CLLocationManagerDelegate {
}
