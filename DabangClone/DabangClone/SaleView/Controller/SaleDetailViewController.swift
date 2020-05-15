//
//  SaleDetailViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

// 분양-분양디테일화면
class SaleDetailViewController: UIViewController {
  
  // MARK: -Property
  private lazy var tableView = UITableView()
    .then {
      $0.allowsSelection = false
      $0.separatorStyle = .none
  }
  private let bottomButton = SaleDetailBottomView()
  private let navigationView = UIView().then {
    $0.backgroundColor = .clear
  }
  var saleData: SaleInfo!
  var pk: Int!
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
//    self.title
//    apiData()
  }
  
  // MARK: -Action
//  private func apiData() {
//    APIManager.shared.getCertainSaleData(id: pk) { (result) in
//      switch result {
//      case .success(let sale):
//        self.saleData = sale
//      case .failure(let error):
//        print(error)
//      }
//    }
//  }
//  
  // MARK: -setupUI
  private func setupUI() {
    view.addSubviews([
      tableView,
      bottomButton,
      navigationView,
    ])
    tableView.backgroundColor = .white
    tableView.contentInsetAdjustmentBehavior = .never
    //    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.barStyle = .black
    
    tableView.register(SaleDetailMainCell.self, forCellReuseIdentifier: SaleDetailMainCell.identifier)
    tableView.register(SaleDetailSectionCell.self, forCellReuseIdentifier: SaleDetailSectionCell.identifier)
    tableView.register(SaleDetailSectionCell.self, forCellReuseIdentifier: SaleDetailSectionCell.identifier)
    tableView.register(SaleDetailSaleInfoCell.self, forCellReuseIdentifier: SaleDetailSaleInfoCell.identifier)
    tableView.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
    tableView.register(SaleDetailParcelPriceCell.self, forCellReuseIdentifier: SaleDetailParcelPriceCell.identifier)
    tableView.register(SaleDetailScheduleCell.self, forCellReuseIdentifier: SaleDetailScheduleCell.identifier)
    tableView.register(SaleDetailNearMapCell.self, forCellReuseIdentifier: SaleDetailNearMapCell.identifier)
    tableView.register(SaleDetailRecommendCell.self, forCellReuseIdentifier: SaleDetailRecommendCell.identifier)
    
    tableView.dataSource = self
    tableView.delegate = self
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    bottomButton.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(70)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(bottomButton.snp.top)
    }
    navigationView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(88)
    }
  }
}


// MARK: -UITableViewDataSource

extension SaleDetailViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 11
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailMainCell.identifier, for: indexPath) as! SaleDetailMainCell
      if saleData.image.isEmpty {
//        let image = "saleEmptyImage"
        print("이미지없엉..")
      } else {
        let url = URL(string: "https://dabang.s3.amazonaws.com/" + saleData.image[0])!
        cell.configue(imgae: url)
      }
      cell.backgroundColor = .white
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailSectionCell.identifier, for: indexPath) as! SaleDetailSectionCell
      cell.configue(parcelPrice: saleData.salesPrice, parcelhousehold: saleData.salesCitizen, recruitmentNotice: saleData.recruit, scheduledDate: saleData.recruit)
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailSaleInfoCell.identifier, for: indexPath) as! SaleDetailSaleInfoCell
      cell.configue(buildingType: saleData.salesType.rawValue, supplyType: saleData.supplyType.rawValue, totalHouseholds: "총 \(saleData.totalCitizen) / 분양 \(saleData.salesCitizen)", sizeComplex: "\(saleData.complexScale) / \(saleData.minMaxFloor)", exclusiveArea: saleData.area, constructionCompany: saleData.builder, pilotCompany: saleData.developer, regulatoryPeriod: "입주자로 선정된 날부터 6개월", others: "전매제한, 분양가상한제 미적용")
      return cell
    case 3, 5, 7, 9:
      let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier, for: indexPath) as! GrayLineViewCell
      return cell
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailParcelPriceCell.identifier, for: indexPath) as! SaleDetailParcelPriceCell
      cell.configue(parcelPriceLabel: "3억3370 ~ 5억2940", flatPriceLabel: "1622", averageLabel: "1323")
      return cell
    case 6:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailScheduleCell.identifier, for: indexPath) as! SaleDetailScheduleCell
      cell.delegate = self
      return cell
    case 8:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailNearMapCell.identifier, for: indexPath) as! SaleDetailNearMapCell
      cell.configue(addressLabel: "인천광역시 부평구 십정동 186-375 번지 일원", mart: "킴스클럽 부평점", hospital:
        "가톨릭대학교 인천성모병원", institute: "부평3동주민센터", cultural: "부평아트센터 부평아트하우스", martSpace: "901m", hospitalSpace: "1.8km", instituteSpace: "413m", culturalSpace: "102m")
      return cell
    case 10:
      let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailRecommendCell.identifier, for: indexPath) as! SaleDetailRecommendCell
      return cell
    default:
      return UITableViewCell()
    }
  }
}

extension SaleDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    0
  }
}

extension SaleDetailViewController: SaleDetailScheduleCellDelegate {
  func didTapButton() {
    let vc = SaleDetailAlertViewController()
    vc.modalPresentationStyle = .custom
    present(vc,animated: true)
  }
}

extension SaleDetailViewController {
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
