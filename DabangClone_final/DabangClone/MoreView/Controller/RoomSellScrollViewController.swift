//
//  RoomSellScrollViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class RoomSellScrollViewController: UIViewController {
  //MARK: - Property
  var pageNum = 0
  let topSegmentView = UISegmentedControl(items: ["주소", "기본정보", "추가정보", "설명"]).then {
    $0.setTitleTextAttributes([
        NSAttributedString.Key.foregroundColor: UIColor(named: "SegmentSelected")!,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)
    ], for: .selected)
    $0.backgroundColor = UIColor(named: "SegmentBackground")
    $0.tintColor = UIColor(named: "SegmentBackground")
    $0.forcedImplementBackgroundColor()
    $0.setTitleTextAttributes([
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular),
      NSAttributedString.Key.foregroundColor: UIColor(named: "SegmentLabel")!
    ], for: .normal)
  }
  let customSegment = CustomSegmentView()
  let scrollView = UIScrollView()
  let stackView = UIStackView()
  let firstContainerView = UIView().then {
    $0.backgroundColor = .blue
    $0.tag = 0
  }
  let secondContainerView = UIView().then {
    $0.backgroundColor = .white
    $0.tag = 1
  }
  let thirdContainerView = UIView().then {
    $0.backgroundColor = .orange
    $0.tag = 2
  }
  let fourthContainerView = UIView().then {
    $0.backgroundColor = .brown
    $0.tag = 3
  }
  
  let bezel1 = Graybezel()
  let bezel2 = Graybezel()
  let bezel3 = Graybezel()
  
  var pageIdx: CGFloat?
  
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.isHidden = false
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    view.isHidden = false
    moveToSegmentedControl(pageNum)
    topSegmentView.selectedSegmentIndex = pageNum
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    view.isHidden = true
  }
  
  
  //MARK: - setupUI & setupConstraints
  
  private func setupUI() {
    topSegmentView.addTarget(self, action: #selector(didTapSegmentedControl), for: .valueChanged)
    view.addSubviews([topSegmentView, scrollView, customSegment])
    view.addSubviews([bezel1, bezel2, bezel3])
    scrollView.isPagingEnabled = true
    scrollView.clipsToBounds = false
    scrollView.delegate = self
    scrollView.addSubviews([stackView])
    stackView.addSubviews([firstContainerView,secondContainerView,thirdContainerView,fourthContainerView])
    setupConstraints()
    addChildController()
  }
  private func setupConstraints() {
    topSegmentView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 0, left: -30, bottom: 0, right: -30))
      $0.height.equalTo(45)
    }
    
    bezel1.snp.makeConstraints {
      $0.centerX.equalTo(topSegmentView).multipliedBy(0.4)
      $0.centerY.equalTo(topSegmentView)
      $0.width.equalTo(50)
      $0.height.equalTo(1)
    }
    
    bezel2.snp.makeConstraints {
      $0.centerX.equalTo(topSegmentView)
      $0.centerY.equalTo(topSegmentView)
      $0.width.equalTo(46)
      $0.height.equalTo(1)
    }
    
    bezel3.snp.makeConstraints {
      $0.centerX.equalTo(topSegmentView).multipliedBy(1.6)
      $0.centerY.equalTo(topSegmentView)
      $0.width.equalTo(50)
      $0.height.equalTo(1)
    }
    
    scrollView.snp.makeConstraints {
      $0.top.equalTo(topSegmentView.snp.bottom)
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    stackView.snp.makeConstraints {
      $0.leading.trailing.top.bottom.equalToSuperview()
      $0.height.equalToSuperview()
    }
    
    firstContainerView.snp.makeConstraints {
      $0.leading.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
      $0.height.equalTo(scrollView)
    }
    secondContainerView.snp.makeConstraints {
      $0.leading.equalTo(firstContainerView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
    }
    thirdContainerView.snp.makeConstraints {
      $0.leading.equalTo(secondContainerView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
    }
    fourthContainerView.snp.makeConstraints {
      $0.leading.equalTo(thirdContainerView.snp.trailing)
      $0.trailing.equalTo(scrollView.snp.trailing)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(scrollView)
      
    }
  }
  //MARK: - Actions
  
  @objc private func didTapSegmentedControl() {
    print("Did Tap SegmentedControl")
    switch topSegmentView.selectedSegmentIndex {
    case 0:
      scrollView.contentOffset.x = 0
    case 1:
      scrollView.contentOffset.x = scrollView.frame.size.width
    case 2:
      scrollView.contentOffset.x = scrollView.frame.size.width * 2
    case 3:
      scrollView.contentOffset.x = scrollView.frame.size.width * 3
    default:
      break
    }
  }
  
  func moveToSegmentedControl(_ pageNum: Int) {
    print("Did Tap SegmentedControl")
    switch pageNum {
    case 0:
      scrollView.contentOffset.x = 0
    case 1:
      scrollView.contentOffset.x = scrollView.frame.size.width
    case 2:
      scrollView.contentOffset.x = scrollView.frame.size.width * 2
    case 3:
      scrollView.contentOffset.x = scrollView.frame.size.width * 3
    default:
      break
    }
  }
  
  func addChildController() {
    _ = [
      firstContainerView:AddressViewController(),
      secondContainerView:BaseViewController(),
      thirdContainerView:OneRoomAddInfoViewController(),
      fourthContainerView:ExplainViewController()
      ].forEach { add(childVC: $0.value, to: $0.key) }
  }
  
  func add(childVC: UIViewController, to containerView: UIView) {
    addChild(childVC)
    containerView.addSubview(childVC.view)
    childVC.view.frame = containerView.bounds
    childVC.didMove(toParent: self)
  }
}


extension RoomSellScrollViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    //current page index
    pageIdx = scrollView.contentOffset.x / scrollView.frame.size.width
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    // changed page index. if that is different with current page idx, Selected segmented control item will change.
    if pageIdx != scrollView.contentOffset.x / scrollView.frame.size.width {
      print("current page is ")
      let currentPageIdx = Int((scrollView.contentOffset.x / scrollView.frame.size.width) + 1)
      switch currentPageIdx {
      case 1:
        topSegmentView.selectedSegmentIndex = 0
      case 2:
        topSegmentView.selectedSegmentIndex = 1
      case 3:
        topSegmentView.selectedSegmentIndex = 2
      case 4:
        topSegmentView.selectedSegmentIndex = 3
      default:
        break
      }
    } else {
      print("Equal Page")
    }
  }
}

class Graybezel: UIView {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    backgroundColor = UIColor(named: "SegmentBezel")
    frame.size = CGSize(width: 1, height: 1)
    setupConstraints()
  }
  private func setupConstraints() {
  }
}
