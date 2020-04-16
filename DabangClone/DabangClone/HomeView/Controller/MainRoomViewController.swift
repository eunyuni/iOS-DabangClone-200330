//
//  RoomViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/05.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Kingfisher

class MainRoomViewController: UIViewController {
  let roomData = findRoomDataFromRoomID(rooms, roomID: 1)
  
  //MARK: - Property
  let scrollView = UIScrollView().then {
    $0.backgroundColor = .gray
    $0.alwaysBounceVertical = true
    $0.isUserInteractionEnabled = false
  }
  
  let contentsView = UIView().then {
    $0.backgroundColor = .cyan
  }
  
  let imageScrollView = UIScrollView().then {
    $0.isPagingEnabled = true
    $0.backgroundColor = .orange
    $0.alwaysBounceHorizontal = true
    $0.isUserInteractionEnabled = false

  }
  
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
  
  let roomTypeImage = UIImageView().then {
    $0.image = UIImage(named: "RoomStyleImage")
  }
  let roomTypeLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textAlignment = .center
  }
  let areaImage = UIImageView().then {
    $0.image = UIImage(named: "AreaSizeImage")
  }
  let areaLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textAlignment = .center
  }
  
  let floorImage = UIImageView().then {
    $0.image = UIImage(named: "FloorImage")
  }
  let floorLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textAlignment = .center
  }
  let adminImage = UIImageView().then {
    $0.image = UIImage(named: "AdminImage")
  }
  let adminLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textAlignment = .center
  }
  
  let bezel2 = Graybezel()
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupUI()
    setupImages()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  //MARK: - SetupUI & SetupConstraints
  
  private func setupUI() {
    imageScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.3)
    
    titleView.frame = CGRect(x: 0, y: imageScrollView.frame.maxY, width: view.frame.width, height: 280)
    
    titleLabel.text = "\(roomData.baseInfo.sellStyle) \(roomData.baseInfo.cost)"
    subtitleLabel.text = "\(roomData.baseInfo.detailText)"
    
    
    view.addSubviews([scrollView])
    scrollView.addSubview(contentsView)
    contentsView.addSubviews([imageScrollView, titleView])
    titleView.addSubviews([titleLabel, subtitleLabel, bezel1, roomTypeImage, roomTypeLabel, areaImage, areaLabel, floorImage, floorLabel, adminImage, adminLabel, bezel2])
    setupConstraints()
  }
  
  private func setupConstraints() {
    scrollView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    contentsView.snp.makeConstraints {
      $0.top.trailing.leading.equalTo(scrollView)
      $0.bottom.equalTo(scrollView)
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
      $0.height.equalTo(1)
    }
    
    roomTypeImage.snp.makeConstraints {
      $0.top.equalTo(bezel1.snp.bottom).offset(15)
      $0.leading.equalToSuperview().offset(46)
      $0.height.equalTo(33)
      $0.width.equalTo(31)
    }
    
    
    
  }
  
  //MARK: - Actions
  private func setupImages() {
    let images = roomData.images
    for i in 0..<images.count {
      let imageView = UIImageView()
      let url = URL(string: images[i].image)
      imageView.kf.setImage(with: url)
      imageView.contentMode = .scaleAspectFill
      let xPosition = self.view.frame.width * CGFloat(i)
      imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.imageScrollView.frame.height)
      
      imageScrollView.contentSize.width = self.view.frame.width * CGFloat(1+i)
      
      imageScrollView.addSubview(imageView)
    }
    
  }
  
}



