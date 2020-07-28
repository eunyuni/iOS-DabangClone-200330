//
//  SaleInformationViewController.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
// 분양 모두보기
class SaleInformationViewController: UIViewController {
  
  // MARK: - Property
  private let tableView = UITableView().then {
    $0.register(SaleInformationTableViewCell.self, forCellReuseIdentifier: SaleInformationTableViewCell.identifier)
    $0.allowsSelection = false
  }
  private let topView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.9371830225, green: 0.9372954965, blue: 0.9371448159, alpha: 1)
  }
  private let topLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 15)
    $0.textColor = .gray
    $0.text = "전국"
  }
  private let tapGesture = UITapGestureRecognizer()
  
  //  var saleData: [SaleInfo] = []
  var saleTiny: [SaleTiny] = []
  var saleTiny2: [SaleTiny] = []
  var arrayInt: [Int] = []
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarController?.tabBar.isHidden = true
    self.view.backgroundColor = .white 
    setupUI()
    //    apiData()
  }
  // MARK: - Action
  //  private func apiData() {
  //    APIManager.shared.getCertainSaleData(id: 88) { (result) in
  //      switch result {
  //      case .success(let sale):
  //        self.saleData = [sale]
  //      case .failure(let error):
  //        print(error)
  //      }
  //    }
  //  }
  func saleReload() {
    tableView.reloadData()
  }
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer){
    let vc = SaleAreaViewController()
    vc.modalPresentationStyle = .custom
    vc.delegate = self
    present(vc, animated: true, completion: nil)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.navigationItem.title = "분양 정보"
    tableView.dataSource = self
    tableView.delegate = self
    self.tapGesture.addTarget(self, action: #selector(didTapGesture(_:)))
    self.topView.addGestureRecognizer(tapGesture)
    self.view.addSubviews([tableView,topView,topLabel])
    self.topView.addSubviews([topLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    topView.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().dividedBy(20)
    }
    topLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(10)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension SaleInformationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if topLabel.text == "전국" {
      return saleTiny.count
    } else {
      return saleTiny2.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if topLabel.text == "전국" {
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleInformationTableViewCell.identifier, for: indexPath) as! SaleInformationTableViewCell
      cell.configue(saleTiny[indexPath.row])
      cell.delegate = self
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleInformationTableViewCell.identifier, for: indexPath) as! SaleInformationTableViewCell
      cell.configue(saleTiny2[indexPath.row])
      cell.delegate = self
      return cell
    }
  }
  
}

extension SaleInformationViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath.row)
    print("??")
  }
}

extension SaleInformationViewController: SaleInformationTableViewCellDelegate {
  
  func didTapSaleDetailCell(id: Int) {
    let vc = SaleDetailViewController()
    APIManager.shared.getCertainSaleData(id: id) { (response) in
      switch response {
      case .success(let saleInfo):
        vc.saleData = saleInfo
        print("getCertainSaleData❤️ id->\(id) ")
        self.navigationController?.pushViewController(vc, animated: true)
      case .failure(let error):
        print("getCertainSaleData Error🤪\(error)")
      }
    }
  }
}


extension SaleInformationViewController: SaleAreaViewControllerDelegate {
  func abcde(area: String) {
    topLabel.text = area
    saleTiny2 = saleTiny.filter({
      $0.place.contains(self.topLabel.text!)
    })
    self.tableView.reloadData()
  }
}
