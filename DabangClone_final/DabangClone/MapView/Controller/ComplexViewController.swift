//
//  ComplexViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/29.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ComplexViewController: UIViewController {

    // MARK: -Property
      private var data: Complex?
      
      private let tableView = UITableView().then {
        $0.allowsSelection = false
        $0.separatorStyle = .none
      }
      
      // MARK: -Lift cycle
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
      }
      
      // MARK: -Action
      
      
      // MARK: -setupUI
      private func setupUI() {
        self.tabBarController?.tabBar.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(ComplexTableViewCell.self, forCellReuseIdentifier: ComplexTableViewCell.identifier)
        tableView.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
        tableView.register(SaleDetailNearMapCell.self, forCellReuseIdentifier: SaleDetailNearMapCell.identifier)
        tableView.register(ComplexRecommendTableViewCell.self, forCellReuseIdentifier: ComplexRecommendTableViewCell.identifier)
        //    tableView.register(MainRoomSecondTableViewCell.self, forCellReuseIdentifier: MainRoomSecondTableViewCell.identifier)
        view.addSubview(tableView)
        setupConstraint()
      }
      
      // MARK: -setupConstraint
      
      private func setupConstraint() {
        tableView.snp.makeConstraints {
          $0.edges.equalToSuperview()
        }
      }
    
    func setupData(complex: Complex) {
        self.data = complex
        title = data?.complexName
        tableView.reloadData()
    }
    
      
}

    extension ComplexViewController: UITableViewDataSource {
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
          let cell = tableView.dequeueReusableCell(withIdentifier: ComplexTableViewCell.identifier, for: indexPath) as! ComplexTableViewCell
          cell.configue(complex: self.data!)
          return cell
//        case 1, 3:
//          let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier, for: indexPath)
//          return cell
//        case 2:
//          let cell = tableView.dequeueReusableCell(withIdentifier: SaleDetailNearMapCell.identifier, for: indexPath) as! SaleDetailNearMapCell
//          cell.configue(addressLabel: "인천광역시 부평구 십정동 186-375 번지 일원", mart: "킴스클럽 부평점", hospital:
//            "가톨릭대학교 인천성모병원", institute: "부평3동주민센터", cultural: "부평아트센터 부평아트하우스", martSpace: "901m", hospitalSpace: "1.8km", instituteSpace: "413m", culturalSpace: "102m")
//          return cell
//        case 4:
//          let cell = tableView.dequeueReusableCell(withIdentifier: ComplexRecommendTableViewCell.identifier, for: indexPath) as! ComplexRecommendTableViewCell
//          return cell
        default:
          return UITableViewCell()
        }
      }
    }

    extension ComplexViewController: UITableViewDelegate {
        
    }
