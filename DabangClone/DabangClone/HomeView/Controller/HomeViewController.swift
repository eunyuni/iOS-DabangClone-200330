//
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Property
    private let homeView = HomeView()
    private let tableView = UITableView().then {
      $0.register(HomeTopTableViewCell.self, forCellReuseIdentifier: HomeTopTableViewCell.identifier)
      $0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
      $0.backgroundColor = .white
      $0.allowsSelection = false
    }
    // MARK: - Lift cycle
    override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = .white
      setupUI()
    }
    
    // MARK: - Action
    
    // MARK: - setupUI
    private func setupUI() {
      tableView.dataSource = self
      tableView.delegate = self
      self.view.addSubviews([tableView])
      setupConstraint()
    }
    
    // MARK: - setupConstraint
    private func setupConstraint() {
      let guide = self.view.safeAreaLayoutGuide
  //    homeView.snp.makeConstraints {
  //      $0.top.leading.trailing.bottom.equalTo(guide)
  //    }
      tableView.snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalTo(guide)
      }
    }
  }

  extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
      2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
        return 1
      }
      else {
        return 4
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopTableViewCell.identifier, for: indexPath)
        return cell
      }
      let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
      cell.configue(data: datas[indexPath.row])
      return cell
    }
  }


  extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      if section == 1 {
        let view = SearchView()

        return view
      }
      return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      if section == 0 {
        return 0
      } else {
        return 90
      }
    }
  }

