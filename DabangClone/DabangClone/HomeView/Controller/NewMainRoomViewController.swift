//
//  NewMainRoomViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/06.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class NewMainRoomViewController: UIViewController {
  static let frammm = NewMainRoomViewController().view.frame
  
  //MARK: - Property
  let tableView = UITableView()
    let navigationView = UIView().then {
        $0.backgroundColor = .clear
    }
  var pk: Int?
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//    self.navigationController?.navigationBar.shadowImage = UIImage()
//    self.navigationController?.navigationBar.isTranslucent = true
//    self.navigationController?.view.backgroundColor = UIColor.clear
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.barStyle = .black
    tabBarController?.tabBar.isHidden = true
    view.backgroundColor = .blue
    setupUI()
  }
  
  
  //MARK: - SetupUI & SetupContstraints
  
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.register(MainRoomTableViewCell.self, forCellReuseIdentifier: MainRoomTableViewCell.identifier)
    tableView.register(MainRoomSecondTableViewCell.self, forCellReuseIdentifier: MainRoomSecondTableViewCell.identifier)
    view.addSubview(tableView)
    setupConstraints()
  }
  
  func setTableViewReload() {
    tableView.reloadData()
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}

extension NewMainRoomViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainRoomTableViewCell.identifier, for: indexPath) as! MainRoomTableViewCell
      cell.setupUI(pk: self.pk!)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: MainRoomSecondTableViewCell.identifier, for: indexPath) as! MainRoomSecondTableViewCell
      cell.reloadCollectionView(pk: self.pk!)
      return cell
    }
  }
}

extension NewMainRoomViewController: UITableViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 192.0 {
      self.navigationView.backgroundColor? = UIColor.white.withAlphaComponent(scrollView.contentOffset.y / 192)
    }
    if scrollView.contentOffset.y < 132.0 {
    navigationController?.navigationBar.barStyle = .black
    }else {
      navigationController?.navigationBar.barStyle = .default
    }
  }
}
