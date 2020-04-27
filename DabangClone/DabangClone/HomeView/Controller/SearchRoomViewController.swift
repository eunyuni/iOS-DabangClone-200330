//
//  SearchRoomViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

// 방찾기
class SearchRoomViewController: UIViewController {
  
  var shownRooms = Set<String>()
  var resultRooms = [String]()
  let disposeBag = DisposeBag()
  
  // MARK: - Property
  private let mainView = UIView()
  private let mainHeight = UIScreen.main.bounds.height
  private let topView = UIView().then {
    $0.backgroundColor = UIColor(named: "LightGrayColor")
  }
  private let cancelButton = UIButton().then {
    $0.setImage(UIImage(named: "cancelButton"), for: .normal)
  }
  private let textField = UITextField().then {
    $0.placeholder = "어반빌리움 수유"
    $0.clearButtonMode = .whileEditing
  }
  private let searchImageView = UIImageView().then {
    $0.image = UIImage(named: "searchIcon")?.withTintColor(.lightGray)
  }
  private let tableView = UITableView().then {
    $0.allowsSelection = true
    $0.allowsMultipleSelection = false
    $0.register(EasySearchTableViewCell.self, forCellReuseIdentifier: EasySearchTableViewCell.identifier)
    $0.register(UniversityTableViewCell.self, forCellReuseIdentifier: UniversityTableViewCell.identifier)
    $0.register(SubwayTableViewCell.self, forCellReuseIdentifier: SubwayTableViewCell.identifier)
    $0.register(ApartmentTableViewCell.self, forCellReuseIdentifier: ApartmentTableViewCell.identifier)
    $0.register(OfficetelTableViewCell.self, forCellReuseIdentifier: OfficetelTableViewCell.identifier)
    $0.register(AreaTableViewCell.self, forCellReuseIdentifier: AreaTableViewCell.identifier)
  }
  
  private let eventImageView = UIImageView().then {
    $0.image = UIImage(named: "eventImage")
  }
  
  private var isPresenting = false
  // MARK: - AppLifeCycle
  init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  //  university, subway, apartment, officetel , area
  // MARK: - Action
  @objc private func didTapCancelButton(_ sender: UIButton) {
    print("didTapCancelButton")
    dismiss(animated: true, completion: nil)
  }
  // MARK: - setupUI
  private func setupUI() {
    tableView.dataSource = self
    tableView.delegate = self
    self.cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    self.view.addSubviews([mainView])
    self.mainView.addSubviews([topView,tableView,eventImageView])
    self.topView.addSubviews([cancelButton, textField, searchImageView])
    
    textField
      .rx.text
      .orEmpty
      .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      
      .subscribe(onNext: { [unowned self] query in
        if query.count == 0 {
          self.shownRooms.removeAll()
          self.resultRooms.removeAll()
          self.tableView.reloadData()
        } else {
          self.shownRooms.removeAll()
          self.resultRooms.removeAll()
          BangData.shared.data.map({$0.address.loadAddress}).forEach{ self.shownRooms.insert($0) }
          //self.shownRooms.filter { $0.hasPrefix(query) }.forEach { self.resultRooms.append($0) }
          self.shownRooms.filter { $0.contains(query) }.forEach{ self.resultRooms.append($0) }
          self.resultRooms.sort()
          self.tableView.reloadData()
        }
      })
      .disposed(by: disposeBag)
    
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    mainView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    topView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.13)
    }
    cancelButton.snp.makeConstraints {
      //      $0.top.equalToSuperview().offset(14)
      $0.leading.equalToSuperview().offset(14)
    }
    textField.snp.makeConstraints {
      $0.top.equalTo(cancelButton.snp.bottom).offset(18)
      $0.leading.equalToSuperview().offset(14)
      $0.trailing.equalTo(searchImageView.snp.leading).offset(-10)
      $0.bottom.equalToSuperview().inset(14)
    }
    searchImageView.snp.makeConstraints {
      $0.centerY.equalTo(textField.snp.centerY)
      $0.trailing.equalToSuperview().offset(-14)
      $0.width.height.equalTo(18)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(eventImageView.snp.top)
    }
    eventImageView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(90)
      
    }
  }
}


extension SearchRoomViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if resultRooms.count == 0 {
      return 6
    } else {
      return resultRooms.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if resultRooms.count == 0 {
      switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: EasySearchTableViewCell.identifier, for: indexPath) as! EasySearchTableViewCell
        cell.selectionStyle = .none
        return cell
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityTableViewCell.identifier, for: indexPath) as! UniversityTableViewCell
        cell.selectionStyle = .none
        return cell
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: SubwayTableViewCell.identifier, for: indexPath) as! SubwayTableViewCell
        cell.selectionStyle = .none
        return cell
      case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentTableViewCell.identifier, for: indexPath) as! ApartmentTableViewCell
        cell.selectionStyle = .none
        return cell
      case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: OfficetelTableViewCell.identifier, for: indexPath) as! OfficetelTableViewCell
        cell.selectionStyle = .none
        return cell
      case 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: AreaTableViewCell.identifier, for: indexPath) as! AreaTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = "서울특별시 성동구 성수동1가"
        return cell
      default:
        return UITableViewCell()
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: AreaTableViewCell.identifier, for: indexPath) as! AreaTableViewCell
      cell.titleLabel.text = self.resultRooms[indexPath.row]
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
    }
  }
}

//MARK: - 검색결과 클릭시 맵뷰컨트롤러로 이동
extension SearchRoomViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? AreaTableViewCell {
      let vc = self.presentingViewController as! MainTabBarViewController
      let vcVC = vc.viewControllers![2] as! UINavigationController
      let mapVC = vcVC.viewControllers[0] as! MapViewController
      mapVC.pkArrInCluster.removeAll()
      mapVC.searchLoad = true
      print(cell.titleLabel.text)
      BangData.shared.data.filter{ $0.address.loadAddress == cell.titleLabel.text }.forEach {
        mapVC.pkArrInCluster.append(String($0.pk))
        print($0.pk)
      }
      mapVC.tabBarController?.selectedIndex = 2
      self.dismiss(animated: true, completion: nil )
    }
    print((tableView.cellForRow(at: indexPath) as? EasySearchTableViewCell) != nil)
    if (tableView.cellForRow(at: indexPath) as? EasySearchTableViewCell) != nil {
      print("check")
      let vc = FindEasyRoomViewController()
//      vc.modalPresentationStyle = .fullScree0n
//      navigationController?.pushViewController(vc, animated: true)
      present(vc, animated: true, completion: nil)
    }
    
  }
}

extension SearchRoomViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    guard let toVC = toViewController else { return }
    isPresenting = !isPresenting
    
    if isPresenting == true {
      containerView.addSubview(toVC.view)
      
      mainView.frame.origin.y += mainHeight
      transitionContext.completeTransition(true)
      self.mainView.frame.origin.y -= self.mainHeight
      //      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
      //        self.mainView.frame.origin.y -= self.mainHeight
      //      }, completion: { (finished) in
      //
      //      })
    } else {
      self.mainView.frame.origin.y += self.mainHeight
      transitionContext.completeTransition(true)
      //      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
      //        self.mainView.frame.origin.y += self.mainHeight
      //      }, completion: { (finished) in
      //        transitionContext.completeTransition(true)
      //      })
    }
  }
}
