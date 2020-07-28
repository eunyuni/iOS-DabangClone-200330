//
//  AddressViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
  
  //MARK: - Property
//  private var googleMap = GMSMapView().then {
//    $0.showsLargeContentViewer = true
//    $0.isMyLocationEnabled = true
//    $0.settings.compassButton = true
//    $0.settings.zoomGestures = true
//  }
  let grayView = UIView().then {
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.layer.borderWidth = 0.6
    $0.layer.cornerRadius = 4
  }
  
  let titleLabel = UILabel().then {
    $0.text = "주소는 동, 면, 읍까지만 노출됩니다."
    $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.textAlignment = .center
  }
  
  lazy var findAddressButton = UIButton().then {
    $0.layer.borderWidth = 0.6
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 2
    $0.setTitle("주소 찾기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.addTarget(self, action: #selector(didTapFindAddressButton), for: .touchUpInside)
  }
  
  let bottomLable = UILabel().then {
    $0.text = "검색해도 주소가 나오지 않는 경우\n고객센터 02-1899-6840으로 문의해주세요."
    $0.numberOfLines = 0
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    $0.textAlignment = .center
  }
  
    private let roadAddressImageView = UIImageView().then {
      $0.image = UIImage(named: "roadAddressIcon")
    }
    private let roadAddressLabel = UILabel().then {
      $0.text = "경기도 김포시 사우로 1"
    }
    private let addressImageView = UIImageView().then {
      $0.image = UIImage(named: "numberIcon")
    }
    private let addressLabel = UILabel().then {
      $0.text = "경기도 김포시 사우동 889"
    }
  
    private let mapView = GMSMapView().then {
      $0.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    }
  
  
    private let addressDetailTextField = UITextField().then {
      $0.placeholder = "동, 호수 등 상세주소 입력"
      $0.layer.borderWidth = 0.6
      $0.layer.borderColor = UIColor.lightGray.cgColor
      $0.layer.cornerRadius = 4
      $0.addLeftPadding(20)
    }
    private let buttonLabel = UILabel().then {
      $0.font = .systemFont(ofSize: 12)
      $0.text = "고시원, 고시텔 등 고시원업 매물은 올릴 수 없으며 등록 시 비공개 처리됩니다."
    }
  
  //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white

      setupUI()
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if RoomForSale.shared.roomData.loadAddress != nil {
      configue()
    } else {
      self.hiddenSet()
    }
  }
  
  //MARK: - setupUI & setupConstraints
  
  private func setupUI() {
    view.addSubviews([grayView])
    grayView.addSubviews([titleLabel, findAddressButton, bottomLable])
    grayView.addSubviews([roadAddressImageView,roadAddressLabel,addressImageView,addressLabel,addressDetailTextField,buttonLabel,mapView])
//    [roadAddressImageView,roadAddressLabel,addressImageView,addressLabel,addressDetailTextField,buttonLabel,mapView].forEach {
//      $0.isHidden = true
//    }
    hiddenSet()
    setupConstraints()
  }
  
  private func setupConstraints() {
    grayView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
    titleLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(50)
    }
    findAddressButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(2)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
      $0.height.equalTo(titleLabel)
    }
    
    bottomLable.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(50)
    }
    
    roadAddressImageView.snp.makeConstraints {
          $0.top.equalTo(findAddressButton.snp.bottom).offset(8)
          $0.leading.equalTo(findAddressButton.snp.leading)
          $0.height.equalTo(roadAddressLabel.snp.height).multipliedBy(1.2)
      $0.width.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
        roadAddressLabel.snp.makeConstraints {
          $0.leading.equalTo(roadAddressImageView.snp.trailing).offset(8)
          $0.centerY.equalTo(roadAddressImageView.snp.centerY)
        }
        addressImageView.snp.makeConstraints {
          $0.top.equalTo(roadAddressImageView.snp.bottom).offset(8)
          $0.leading.equalTo(findAddressButton.snp.leading)
          $0.height.equalTo(addressLabel.snp.height).multipliedBy(1.2)
          $0.width.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
        addressLabel.snp.makeConstraints {
          $0.leading.equalTo(addressImageView.snp.trailing).offset(8)
          $0.centerY.equalTo(addressImageView.snp.centerY)
        }
        addressDetailTextField.snp.makeConstraints {
          $0.top.equalTo(addressImageView.snp.bottom).offset(8)
    //      $0.leading.equalToSuperview().offset(8)
    //      $0.trailing.equalToSuperview().offset(-8)
          $0.centerX.equalToSuperview()
          $0.width.equalToSuperview().multipliedBy(0.9)
          $0.height.equalTo(50)
        }
        buttonLabel.snp.makeConstraints {
          $0.centerX.equalToSuperview()
          $0.top.equalTo(addressDetailTextField.snp.bottom).offset(12)
        }
        mapView.snp.makeConstraints {
          $0.bottom.leading.trailing.equalToSuperview()
          $0.top.equalTo(buttonLabel.snp.bottom).offset(12)
        }
  }
  
  //MARK: - Action
  @objc private func didTapFindAddressButton() {
    let vc = AddressSearchViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
//    navigationController?.pushViewController(vc, animated: true)
  }
  
  private func hiddenSet() {
    [roadAddressImageView,roadAddressLabel,addressImageView,addressLabel,addressDetailTextField,buttonLabel,mapView].forEach {
      $0.isHidden = true
    }
  }
  
  func configue() {
    [roadAddressImageView,roadAddressLabel,addressImageView,addressLabel,addressDetailTextField,buttonLabel,mapView].forEach {
      $0.isHidden = false
      roadAddressLabel.text = RoomForSale.shared.roomData.loadAddress
      addressLabel.text = RoomForSale.shared.roomData.detailAddress
    }
  }
}
