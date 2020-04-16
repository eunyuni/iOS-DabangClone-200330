 //
 //  RealPropertyViewController.swift
 //  DabangClone
 //
 //  Created by 은영김 on 2020/04/06.
 //  Copyright © 2020 pandaman. All rights reserved.
 //
 
 import UIKit
 
 struct Temp {
  let title: String
  let sub: String
  let image: UIImage
 }
 
 struct Review {
  let id: String
  let sub: String
  let status: Int
 }
 
 // 부동산/중개사무소뷰
 class BrokerageOfficeViewController: UIViewController {
  
  var category = 0
  
  var tempData = [Temp]()
  var reviewData = [Review]()
  
  // MARK: -Property
  private let tableView = UITableView().then {
    $0.allowsSelection = false
    $0.separatorStyle = .none
    //    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  
  // MARK: -Lift cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: -Action
  
  
  // MARK: -setupUI
  private func setupUI() {
    //    view.backgroundColor = UIColor(named: "LightGrayColor")
    
    view.addSubviews([
      tableView,
    ])
    tableView.backgroundColor = .white
    
    tableView.register(BrokerageOfficeTopCell.self, forCellReuseIdentifier: BrokerageOfficeTopCell.identifier)
    tableView.register(BrokerageHomeInfoCell.self, forCellReuseIdentifier: BrokerageHomeInfoCell.identifier)
    tableView.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
    tableView.register(BrokerageHomeBottomCell.self, forCellReuseIdentifier: BrokerageHomeBottomCell.identifier)
    tableView.register(BrokerageReviewTopCell.self, forCellReuseIdentifier: BrokerageReviewTopCell.identifier)
    tableView.register(BrokerageReviewTopCell.self, forCellReuseIdentifier: BrokerageReviewTopCell.identifier)
    tableView.register(BrokerageReviewBodyCell.self, forCellReuseIdentifier: BrokerageReviewBodyCell.identifier)
    tableView.register(BrokerageReviewBottomCell.self, forCellReuseIdentifier: BrokerageReviewBottomCell.identifier)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    setupConstraint()
  }
  
  
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
 }
 
 
 // MARK: -UITableViewDataSource
 
 extension BrokerageOfficeViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }
    else {
      switch category {
      case 0:
        return 3
      case 1:
        return 3
      case 2:
        return 3
      default:
        return 3
      }
    }
    //    return 3
  }
  //  if section == 1
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageOfficeTopCell.identifier, for: indexPath) as! BrokerageOfficeTopCell
      return cell
    } else if indexPath.section == 1 {
      switch category {
      case 0:
        switch indexPath.row {
        case 0:
          let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageHomeInfoCell.identifier, for: indexPath) as! BrokerageHomeInfoCell
          return cell
        case 1:
          let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier, for: indexPath) as! GrayLineViewCell
          return cell
        default:
          let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageHomeBottomCell.identifier, for: indexPath) as! BrokerageHomeBottomCell
          return cell
        }
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
      case 2:
        switch indexPath.row {
        case 0:
          let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageReviewTopCell.identifier, for: indexPath) as! BrokerageReviewTopCell
          return cell
        case 1:
          let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageReviewBodyCell.identifier, for: indexPath) as! BrokerageReviewBodyCell
          return cell
        default:
          
          let cell = tableView.dequeueReusableCell(withIdentifier: BrokerageReviewBottomCell.identifier, for: indexPath) as! BrokerageReviewBottomCell
          return cell
        }
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
      }
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
 }
 
 
 
 extension BrokerageOfficeViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerSection = BrokerageSectionView()
    headerSection.delegate = self
    return headerSection
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1{
      
      return 52
    } else {
      return 0
    }
  }
 }
 
 
 extension BrokerageOfficeViewController: BrokerageSectionViewDelegate {
  func didTap(sender: UIButton) {
    category = sender.tag
    print(sender.tag)
    
    let indexPaths: [IndexPath]
    switch category {
    case 0:
      indexPaths = makeIndexPath(count: 3)
      
    case 1:
      print(tempData.count)
      indexPaths = makeIndexPath(count: 3 + tempData.count)
      
    case 2:
      indexPaths = makeIndexPath(count: 3 + reviewData.count)
      
    default:
      indexPaths = [IndexPath]()
    }
    
    tableView.reloadRows(at: indexPaths, with: .fade)
    //        tableView.reloadData()
  }
  
  private func makeIndexPath(count: Int) -> [IndexPath] {
    var tempIndexPaths = [IndexPath]()
    for i in 0..<count {
      let tempIndexPath = IndexPath(row: i, section: 1)
      tempIndexPaths.append(tempIndexPath)
    }
    return tempIndexPaths
  }
  
  
 }
