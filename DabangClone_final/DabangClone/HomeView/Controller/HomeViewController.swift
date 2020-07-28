//
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Alamofire

class BangData {
  static let shared = BangData()
  
  var data: [DabangElement] = []
}

class HomeViewController: UIViewController {
  // MARK: - Property
  private let homeView = HomeView()
  private let tableView = UITableView().then {
    $0.register(HomeTopTableViewCell.self, forCellReuseIdentifier: HomeTopTableViewCell.identifier)
    $0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    $0.register(HomeBottomTableViewCell.self, forCellReuseIdentifier: HomeBottomTableViewCell.identifier)
    $0.backgroundColor = .white
    $0.allowsSelection = false
  }
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
//        checkAuth()
    APIManager.shared.logout()
    self.view.backgroundColor = .white
//    getTest()
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBarController?.tabBar.isHidden = false
    APIManager.shared.put() { data in
      print(data)
    }
    
    
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let udDay = (UserDefaults.standard.value(forKey: "TodayPopUp") as? Int) ?? 0
    if udDay != checkToday() {
      doFirstViewAlert()
    }
  }
  
  
  // MARK: - Action
  private func doFirstViewAlert() {
    let AlertVC = HomeAlertViewController()
    AlertVC.modalPresentationStyle = .overFullScreen
    present(AlertVC, animated: false)
  }
  
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
  
  private func checkToday() -> Int {
    let now = Date()
    let date = DateFormatter()
    date.locale = Locale(identifier: "ko_kr")
    date.dateFormat = "dd"
    return Int(date.string(from: now)) ?? 0
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
      return 5
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopTableViewCell.identifier, for: indexPath)
      return cell
    } else {
      switch indexPath.row {
      case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeBottomTableViewCell.identifier, for: indexPath) as! HomeBottomTableViewCell
        return cell
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.delegate = self
        cell.configue(data: datas[indexPath.row], indexPath: indexPath)
        return cell
      }
    }
  }
  
  private func getTest() {
    
    let url = URL(string: "http://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com/posts/list/")
    
    
    AF
      .request(url!, method: .get, parameters: .none, encoding: URLEncoding.default, headers: .none, interceptor: .none)
      .responseData(queue: .global(), completionHandler: { (response) in
        print(response.data as Any)
        
        if let jsonObjects = try? JSONDecoder().decode([DabangElement].self, from: response.data ?? Data()) {
          BangData.shared.data = jsonObjects
          print(BangData.shared.data[10])
        } else {
          print("fail")
        }
      })
  }
  
  private func checkAuth() {
    print("----------- CheckAuth : ", APIManager.shared.getAccessTokenFromKeyChain())
//    if APIManager.shared.getAccessTokenFromKeyChain() == "" {
      let vc = LoginViewController()
      self.navigationController?.pushViewController(vc, animated: true)
//    }
  }
}


extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 1 {
      let view = SearchView()
      view.delegate = self
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

extension HomeViewController: SearchViewDelegate {
  func didTapPresent() {
    let vc = SearchRoomViewController()
    vc.modalPresentationStyle = .custom
    
    present(vc,animated: true,completion: nil)
  }
}

extension HomeViewController: HomeTableViewCellDelegate {
  func presentMapController() {
    self.tabBarController?.selectedIndex = 2
  }
  
  func presentSaleController(id: Int) {
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
  
  func presentWebController(url: String) {
    let vc = WebContentViewController()
    let myURL = URL(string: url)
    let myRequest = URLRequest(url: myURL!)
    vc.webView.load(myRequest)
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func presentController(indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      break
    case 1:
      self.tabBarController?.selectedIndex = 1
    case 2:
      self.tabBarController?.selectedIndex = 3
    case 0:
      break
    default:
      break
    }
  }
  
  
}
