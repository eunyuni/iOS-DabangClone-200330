//
//  FilterViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    //    $0.separatorStyle = .none
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    view.addSubviews([
      tableView,
    ])
    
    tableView.register(FilterRoomTypeCell.self, forCellReuseIdentifier: FilterRoomTypeCell.identifier)
    tableView.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
    tableView.register(FilterSaleTypeCell.self, forCellReuseIdentifier: FilterSaleTypeCell.identifier)
    tableView.register(FilterFloorCountCell.self, forCellReuseIdentifier: FilterFloorCountCell.identifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    tableView.snp.makeConstraints {
      
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
  
}

// MARK: -UITableViewDataSource

extension FilterViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    switch row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterRoomTypeCell.identifier , for: indexPath) as! FilterRoomTypeCell
      return cell
    case 1, 6, 8:
      let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier , for: indexPath) as! GrayLineViewCell
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterSaleTypeCell.identifier , for: indexPath) as! FilterSaleTypeCell
      return cell
    case 3, 4, 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
      return cell
    case 9:
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterFloorCountCell.identifier , for: indexPath) as! FilterFloorCountCell
      return cell
//    case 5:
//      let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier , for: indexPath) as! GrayLineViewCell
//      return cell
//      case 6:
//      let cell = tableView.dequeueReusableCell(withIdentifier: FilterFloorCountCell.identifier , for: indexPath) as! FilterFloorCountCell
//  
//      return cell
//    case 6:
//      let cell = tableView.dequeueReusableCell(withIdentifier: FilterFloorCountCell.identifier , for: indexPath) as! FilterFloorCountCell
//      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell
    }
    
    
  }
}
