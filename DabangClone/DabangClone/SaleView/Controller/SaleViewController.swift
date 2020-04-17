//
//  SaleViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaleViewController: UIViewController {
  // MARK: - Property
    static let frame = SaleMainViewController().view.frame
    private let tableView = UITableView().then {
      $0.allowsSelection = false
$0.separatorStyle = .none
      $0.register(SaleTopTableViewCell.self, forCellReuseIdentifier: SaleTopTableViewCell.identifier)
      $0.register(GrayLineViewCell.self, forCellReuseIdentifier: GrayLineViewCell.identifier)
      $0.register(SaleNewsTableViewCell.self, forCellReuseIdentifier: SaleNewsTableViewCell.identifier)
      $0.register(SaleThemeTableViewCell.self, forCellReuseIdentifier: SaleThemeTableViewCell.identifier)
      $0.register(SaleGuideTableViewCell.self, forCellReuseIdentifier: SaleGuideTableViewCell.identifier)
    }
    // MARK: - Lift cycle
    override func viewDidLoad() {
      super.viewDidLoad()
      setupUI()
    }
    
    // MARK: - Action
    
    // MARK: - setupUI
    private func setupUI() {
      self.view.backgroundColor = .white 
      self.navigationItem.title = "분양 정보관"
      self.view.addSubviews([tableView])
      self.tableView.dataSource = self
      self.tableView.delegate = self
      setupConstraint()
    }
    
    // MARK: - setupConstraint
    private func setupConstraint() {
      let guide = self.view.safeAreaLayoutGuide
      tableView.snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalTo(guide)
      }
    }
  }

  extension SaleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: SaleTopTableViewCell.identifier, for: indexPath) as! SaleTopTableViewCell
        cell.delegate = self
        return cell
        case 1, 3, 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: GrayLineViewCell.identifier, for: indexPath) as! GrayLineViewCell
        return cell
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: SaleNewsTableViewCell.identifier, for: indexPath) as! SaleNewsTableViewCell
        return cell
      case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: SaleThemeTableViewCell.identifier, for: indexPath) as! SaleThemeTableViewCell
        return cell
      case 6:
        let cell = tableView.dequeueReusableCell(withIdentifier: SaleGuideTableViewCell.identifier, for: indexPath) as! SaleGuideTableViewCell
        return cell
      default:
        return UITableViewCell()
      }
    }
  }

  extension SaleViewController: UITableViewDelegate {
  }

extension SaleViewController: SaleTopTableViewCellDelegate {
  func didTapInformationButton() {
    let vc = SaleInformationViewController()
    navigationController?.pushViewController(vc, animated: true)
    print("누름")
  }
}
