//
//  AlarmViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/03/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Then

class RoomGuideViewController: UIViewController, RGBodyTableViewCellDelegate {
 
  
  
  // MARK: -Property
  var roomForSaleData = RoomForSale.shared
  let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
  }
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.isHidden = false
    tabBarController?.tabBar.isHidden = true
    
    navigationItem.title = "방 내놓기 안내"
    view.backgroundColor = .white
//    roomForSaleData = RoomForSaleElement(type: nil, description: nil, loadAddress: nil, detailAddress: nil, lng: nil, lat: nil, saleFormType: nil, depositChar: nil, monthlyChar: nil, depositTnt: nil, monthlyInt: nil, floor: nil, areaChar: nil, supplyAreaInt: nil, supplyAreaChar: nil, shortRent: nil, parkingDetail: nil, parkingTF: nil, living_expenses: nil, living_expenses_detail: nil, moveInChar: nil, moveInDate: nil, heatingType: nil, pet: nil, elevator: nil, builtIn: nil, veranda: nil, depositLoan: nil, totalCitizen: nil, totalPark: nil, complete: nil, option: nil)
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    roomForSaleData.reset()
  }
  
  // MARK: -Action
  // MARK: -setupUI
  
  private func setupUI() {
    
    tableView.register(RGTopTableViewCell.self, forCellReuseIdentifier: RGTopTableViewCell.identifier)
    tableView.register(RGBodyTableViewCell.self, forCellReuseIdentifier: RGBodyTableViewCell.identifier)
    tableView.register(RGBottomTableViewCell.self, forCellReuseIdentifier: RGBottomTableViewCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }
  
  func didTapButton(_ sender: UIButton) {
     let vc = SellMyRoomViewController()
     vc.modalPresentationStyle = .fullScreen
     navigationController?.pushViewController(vc, animated: true)
   }
}


// MARK: -UITableViewDataSource
extension RoomGuideViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: RGTopTableViewCell.identifier, for: indexPath)
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: RGBodyTableViewCell.identifier, for: indexPath) as! RGBodyTableViewCell
      cell.cellDelegate = self
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: RGBottomTableViewCell.identifier, for: indexPath)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
  }
  
}

extension RoomGuideViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let mainwidth = UIScreen.main.bounds.width
    switch indexPath.row {
    case 0:
      return mainwidth * 0.34
    case 1:
      return mainwidth * 0.5
    case 2:
      return mainwidth * 1.16
    default:
      return 0
    }
    
  }
}
