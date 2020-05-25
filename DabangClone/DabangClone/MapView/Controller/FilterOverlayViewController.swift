//
//  FilterOverlayViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/05/14.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

protocol FilterOverlayViewControllerDelegate: class {
  func shootSingletonToMapViewController() -> Void
}

class FilterOverlayViewController: UIViewController {
  
  var filterTag = 0 {
    didSet {
      tableView.reloadData()
    }
  }
  
  weak var delegate: FilterOverlayViewControllerDelegate?
  
  private lazy var tableView = UITableView().then {
    $0.register(FilterRoomTypeCell.self, forCellReuseIdentifier: FilterRoomTypeCell.identifier)
    $0.register(FilterSaleTypeCell.self, forCellReuseIdentifier: FilterSaleTypeCell.identifier)
    $0.register(FilterFloorCountCell.self, forCellReuseIdentifier: FilterFloorCountCell.identifier)
    $0.register(FilterRoomStructureCell.self, forCellReuseIdentifier: FilterRoomStructureCell.identifier)
    $0.register(FilterTradeTypeCell.self, forCellReuseIdentifier: FilterTradeTypeCell.identifier)
    $0.register(ApplyAndCancelTableViewCell.self, forCellReuseIdentifier: ApplyAndCancelTableViewCell.identifier)
    $0.register(FileteAddCell.self, forCellReuseIdentifier: FileteAddCell.identifier)
    $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    $0.backgroundColor = .clear
    $0.backgroundView = lowOpacityBlackView
    
    lowOpacityBlackView.addGestureRecognizer(tapGesture)
    $0.dataSource = self
    $0.delegate = self
  }
  
  private lazy var lowOpacityBlackView = UIView().then {
    $0.backgroundColor = .black
    $0.alpha = 0.5
  }
  
  lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBackView))
  
  private let scrollView = UIScrollView().then {
    $0.alwaysBounceHorizontal = true
    $0.backgroundColor = UIColor(named: "FilterScrollViewGray")
    $0.showsHorizontalScrollIndicator = false
  }
  
  private var stackView: UIStackView!
  private let selectButtons = [
    MapFilterButton(title: "방 구조 ⌄", tag: 0).then{
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "거래 종류 ⌄", tag: 1).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "층 수 ⌄", tag: 2).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "추가 필터 ⌄", tag: 3).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "관리비 ⌄", tag: 4).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "가격 ⌄", tag: 5).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "관리비 ⌄", tag: 6).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
    MapFilterButton(title: "방 크기 ⌄", tag: 7).then {
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapDetailFilterButton(_:)), for: .touchUpInside)
    },
  ]
  private let filterButton = UIButton().then {
    $0.setImage(UIImage(named: "FilterImage"), for: .normal)
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.clear
    view.isOpaque = false
    setupUI()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
  private func setupUI() {
    
    view.addSubviews([scrollView, filterButton, tableView])
    stackView = UIStackView(arrangedSubviews: selectButtons)
    stackView.backgroundColor = UIColor(named: "FilterScrollViewGray")
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    scrollView.addSubview(stackView)
    setupConstraints()
  }
  
  private func setupConstraints() {
    
    scrollView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
      $0.leading.equalToSuperview()
      $0.trailing.equalTo(filterButton.snp.leading)
      $0.height.equalTo(47)
    }
    filterButton.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.centerY.equalTo(scrollView.snp.centerY)
      $0.height.equalTo(scrollView.snp.height)
      $0.width.equalTo(51)
    }
    
    stackView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    }
    
    stackView.arrangedSubviews.forEach { v in
      let button = v as! MapFilterButton
      v.snp.makeConstraints { make in
      make.width.equalTo(15 * button.titleLabel!.text!.count + 5)
      make.height.equalTo(35)
    }
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(scrollView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  @objc private func didTapBackView() {
    self.dismiss(animated: false) {
      print("dismissFilterOverlay")
    }
  }
  
  @objc private func didTapDetailFilterButton(_ sender: UIButton) {
    filterTag = sender.tag
    tableView.reloadData()
  }
}

extension FilterOverlayViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch filterTag {
    case 0, 1, 2, 3, 4, 5:
      return 2
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (filterTag, indexPath.row) {
    case (0, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterRoomTypeCell.identifier, for: indexPath) as! FilterRoomTypeCell
      cell.selectionStyle = .none
      return cell
    case (0, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      cell.delegate = self
      return cell
    case (1, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterSaleTypeCell.identifier, for: indexPath) as! FilterSaleTypeCell
      return cell
    case (1, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      return cell
    case (2, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterFloorCountCell.identifier, for: indexPath) as! FilterFloorCountCell
      return cell
    case (2, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      return cell
    case (3, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterRoomStructureCell.identifier, for: indexPath) as! FilterRoomStructureCell
      return cell
    case (3, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      return cell
    case (4, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FileteAddCell.identifier, for: indexPath) as! FileteAddCell
      return cell
      case (4, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      return cell
    case (5, 0):
      let cell = tableView.dequeueReusableCell(withIdentifier: FilterTradeTypeCell.identifier, for: indexPath) as! FilterTradeTypeCell
      return cell
      case (5, 1):
      let cell = tableView.dequeueReusableCell(withIdentifier: ApplyAndCancelTableViewCell.identifier, for: indexPath) as! ApplyAndCancelTableViewCell
      return cell
    default:
      let cell = UITableViewCell()
      return cell
    }
    
  }
  
}

extension FilterOverlayViewController: UITableViewDelegate {
  
}

extension FilterOverlayViewController: ApplyAndCancelTableViewCellDelegate {
  func didTapApplyButtonInRoomTypeCell() {
    delegate?.shootSingletonToMapViewController()
    print("didTapApplyButtonInRoomTypeCellDelegateMethod is run")
  }
}
