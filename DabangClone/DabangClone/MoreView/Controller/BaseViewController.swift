//
//  BaseViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/02.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, InfoCellDelegate {
  
  
  
  
  
  //MARK: - Property
  
  let tableView = UITableView().then {
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 4
  }
  
  //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
      setupUI()
    }
 
  
  //MARK: - setupUI & SetupConstraints
  
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 50
    tableView.isScrollEnabled = false
    tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    tableView.register(InputCell.self, forCellReuseIdentifier: InputCell.identifier)
    tableView.register(AbleSegmentCell.self, forCellReuseIdentifier: AbleSegmentCell.identifier)
    tableView.register(IsThereCell.self, forCellReuseIdentifier: IsThereCell.identifier)
    tableView.register(ThreeSegmentTableViewCell.self, forCellReuseIdentifier: ThreeSegmentTableViewCell.identifier)
    view.addSubview(tableView)
  
    setupConstraints()
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
  }
  
  
  //MARK: - Action
  func didTapCell(title: String) {
    switch title {
    case "가격":
      let vc = PriceViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
    case "층수":
      let vc = CountfloorsViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
    case "방 크기":
      let vc = RoomSizeViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      case "관리비":
      let vc = MaintenanceCostViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      case "주차":
      let vc = ParkingFeeViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
  

}

extension BaseViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, CellType: .Title)
      return cell
    case 1:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.가격, CellType: .Input) as! InputCell
      cell.delegate = self
      return cell
    case 2: 
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.층수, CellType: .Input) as! InputCell
      cell.delegate = self
      return cell
    case 3:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.방크기, CellType: .Input) as! InputCell
      cell.delegate = self
      return cell
    case 4:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.단기임대, CellType: .AbleSegment)
      return cell
    case 5:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.관리비, CellType: .IsThere) as! IsThereCell
      cell.delegate = self
      return cell
    case 6:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.주차, CellType: .AbleSegment) as! AbleSegmentCell
      cell.delegate = self
      return cell
    case 7:
      let cell = setTableViewCell(tableView: tableView, indexPath: indexPath, title: BaseInfo.입주가능일, CellType: .ThreeSegment)
      return cell
    default:
      let cell = UITableViewCell()
      return cell
    }
    
  }
}

extension BaseViewController: UITableViewDelegate {
  
}
