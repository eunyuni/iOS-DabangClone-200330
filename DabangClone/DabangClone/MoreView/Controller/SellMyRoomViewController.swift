//
//  SellMyRoomViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/26.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Then

struct SelectedRoom {
  var roomStyle: RoomStyle
  var roomType: RoomType
}

class SelectedRoomSingleton {
  static let shared = SelectedRoomSingleton()
  var selectedRoom : SelectedRoom?
}


class SellMyRoomViewController: UIViewController, DidSelectRoomTypeDelegate {
  
  
  
  var roomStyle = [
    ExpandableRoom(style: .원룸),
    ExpandableRoom(style: .투룸),
    ExpandableRoom(style: .쓰리룸),
    ExpandableRoom(style: .오피스텔),
    ExpandableRoom(style: .아파트)
  ]
  
  //MARK: - Property
  let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
  let nextButton = UIButton().then {
    $0.backgroundColor = UIColor(named: "DabangLightBlue")
    $0.setTitle("다음", for: .normal)
    $0.setTitleColor(UIColor(named: "unselectColor"), for: .normal)
    $0.titleLabel!.font = UIFont.systemFont(ofSize: 20, weight: .bold)
  }
  
  //MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    print(SelectedRoomSingleton.shared.selectedRoom)
  }
  
  private func setupUI() {
    nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    
    tableView.backgroundColor = .white
    tableView.allowsSelection = false
    tableView.dataSource = self
    tableView.delegate = self
    tableView.isScrollEnabled = false
    tableView.register(OneRoomTableViewCell.self, forCellReuseIdentifier: OneRoomTableViewCell.identifier)
    tableView.register(TwoRoomTableViewCell.self, forCellReuseIdentifier: TwoRoomTableViewCell.identifier)
    tableView.register(ThreeRoomTableViewCell.self, forCellReuseIdentifier: ThreeRoomTableViewCell.identifier)
    tableView.register(OfficeTelTableViewCell.self, forCellReuseIdentifier: OfficeTelTableViewCell.identifier)
    view.addSubview(tableView)
    view.addSubview(nextButton)
    setupContstraints()
  }
  
  private func setupContstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
    }
    nextButton.snp.makeConstraints {
      $0.leading.bottom.trailing.equalToSuperview()
      $0.height.equalTo(70)
    }
  }
  //MARK: - Action
  
  func didSelectRoomType() {
    if SelectedRoomSingleton.shared.selectedRoom != nil {
      print("not nil")
      nextButton.setTitleColor(.white, for: .normal)
    } else {
      print("nil")
    }
  }
  
  @objc private func didTapNextButton() {
    if SelectedRoomSingleton.shared.selectedRoom != nil {
    let vc = RoomSellScrollViewController()
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
    }
  }
  
}//RoomSellScrollViewController

extension SellMyRoomViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return roomStyle.count
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if roomStyle[section].isOpen {
      return 1
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: OneRoomTableViewCell.identifier, for: indexPath) as! OneRoomTableViewCell
      cell.delegate = self
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: TwoRoomTableViewCell.identifier, for: indexPath) as! TwoRoomTableViewCell
      cell.delegate = self
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: ThreeRoomTableViewCell.identifier, for: indexPath) as! ThreeRoomTableViewCell
      cell.delegate = self
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: OfficeTelTableViewCell.identifier, for: indexPath) as! OfficeTelTableViewCell
      cell.delegate = self
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: ApartTableViewCell.identifier, for: indexPath) as! ApartTableViewCell
      return cell
    default:
      let cell = UITableViewCell()
      return cell
//      break
    }
    
    
  }
  
  
}

extension SellMyRoomViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let thumbnailImages: [UIImage] = ["OneRoomThumb", "TwoRoomThumb", "ThreeRoomThumb", "OfficetelThumb", "ApartThumb"].compactMap {
      return UIImage(named: $0)
    }
    let emptyButton = UIButton()
    
    let sectionView = UIView()
    let thumbNailImage = UIImageView().then {
      $0.image = thumbnailImages[section].withRenderingMode(.alwaysTemplate)
      $0.tintColor = UIColor(named: "OriginalTintColor")
      if section == 3 && section == 4 {
        $0.frame.size = CGSize(width: 34, height: 32)
      } else {
      $0.frame.size = CGSize(width: 32, height: 32)
      }
    }
    let button = UIButton(type: .system)
    let sectionTitle = UILabel().then {
      $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    let separatorOfHeader = UIView().then {
      $0.backgroundColor = .white
    }
    
    sectionTitle.text = roomStyle[section].makeTitleText()
    tableView.addSubview(sectionView)
    
    sectionView.addSubviews([separatorOfHeader, button, sectionTitle, thumbNailImage, emptyButton])
    
    if section == 4 {
      button.isHidden = true
      emptyButton.isHidden = true
    }
    if roomStyle[section].isOpen {
      sectionTitle.textColor = UIColor(named: "PureLoginButtonColor")
      thumbNailImage.tintColor = UIColor(named: "PureLoginButtonColor")
    }
    
    button.tag = section
    button.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
    button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    if roomStyle[section].isOpen {
      button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    }
    button.tintColor = .black
    
    emptyButton.tag = section
    emptyButton.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
    tableView.addSubview(sectionView)
    tableView.sectionHeaderHeight = 55
    
    thumbNailImage.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(14)
      $0.width.equalTo(32)
      $0.height.equalTo(32)
    }
    
    button.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-10)
      $0.width.height.equalTo(30)
    }
    
    sectionTitle.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(thumbNailImage.snp.trailing).offset(10)
    }
    separatorOfHeader.snp.makeConstraints {
      $0.leading.equalTo(sectionTitle)
      $0.trailing.equalTo(button)
      $0.top.equalToSuperview().offset(-10)
      $0.height.equalTo(1)
    }
    
    emptyButton.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    return sectionView
  }
  
  @objc private func tapSection(_ sender: UIButton) {
    let section = sender.tag
    
    let isOpen = roomStyle[section].isOpen
    roomStyle[section].isOpen = !isOpen
    
    tableView.beginUpdates()
    if isOpen {
      tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      sender.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    } else {
      for i in 0...4 {
        if section != i {
          if roomStyle[i].isOpen {
            let isOpen = roomStyle[i].isOpen
            roomStyle[i].isOpen = !isOpen
            
            tableView.deleteRows(at: [IndexPath(row: 0, section: i)], with: .automatic)
//            tableView.reloadData()
          }
        }
      }
      sender.setImage(UIImage(systemName: "chevron.up"), for: .normal)
      tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      
    }
    tableView.reloadData()
    tableView.endUpdates()
  }
  
  
}

