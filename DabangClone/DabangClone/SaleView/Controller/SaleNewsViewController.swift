//
//  SaleNewsViewController.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SaleNewsViewController: UIViewController {
  // MARK: - Property
  private let scrollView = UIScrollView().then {
    $0.alwaysBounceHorizontal = true
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
  }
  private let selectButtons = [
    ScrollButton(title: "전체뉴스", tag: 0),
    ScrollButton(title: "정책", tag: 1),
    ScrollButton(title: "분양", tag: 2),
    ScrollButton(title: "동향", tag: 3),
  ]
  private var stackView: UIStackView!
  private let tableView = UITableView().then {
    $0.register(SaleNewsDetailTableViewCell.self, forCellReuseIdentifier: SaleNewsDetailTableViewCell.identifier)
  }
  
  var currentTag = 0 {
    didSet {
      if currentTag != 2 {
//        resetCompareMode()
//        showCompareViewButton(isCompareMode: false)
      }
    }
  }
  // MARK: - Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Action
  @objc private func rightSwipeAction(_ gesture: UISwipeGestureRecognizer) {
    didTapButton(tag: max(currentTag - 1, 0))
  }
  
  @objc private func leftSwipeAction(_ gesture: UISwipeGestureRecognizer) {
    didTapButton(tag: min(currentTag + 1, selectButtons.count - 1))
  }
  
  // MARK: - setupUI
  private func setupUI() {
    self.view.addSubviews([scrollView,tableView])
    selectButtons.forEach({
      $0.delegate = self
    })
    tableView.dataSource = self
    stackView = UIStackView(arrangedSubviews: selectButtons)
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.spacing = 30
    scrollView.addSubview(stackView)
    configureSwipeGesture()
    setupConstraint()
  }
  private func configureSwipeGesture() {
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeAction(_:)))
    rightSwipe.direction = .right
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeAction(_:)))
    leftSwipe.direction = .left
    [rightSwipe, leftSwipe].forEach({tableView.addGestureRecognizer($0)})
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    scrollView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(50)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(40)
    }
    stackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(scrollView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}
extension SaleNewsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SaleNewsDetailTableViewCell.identifier, for: indexPath) as! SaleNewsDetailTableViewCell
    cell.configue()
    return cell
  }
  
  
}

extension SaleNewsViewController: ScrollButtonDelegate {
  func didTapButton(tag: Int) {
    print("didTapButton \(tag)")
    selectButtons.filter{$0.tag == tag}
      .forEach({
        $0.setTitleColor(.black, for: .normal)
        $0.underLineView.isHidden = false
      })
    
    selectButtons.filter{ $0.tag != tag }
      .forEach({
        $0.setTitleColor(.lightGray, for: .normal)
        $0.underLineView.isHidden = true
      })
//    viewModel.dataIndex = tag
    currentTag = tag
    controlAtrributes(tag)
    tableView.reloadData()
//    checkActiveDataIfEmpty(tag)
  }
  
  private func controlAtrributes(_ tag: Int) {
//    underSeparatorHeightConst.constant = 0.5
//    compareView.isHidden = true
    self.view.layoutIfNeeded()
    switch tag {
    case 0,1:
      scrollView.contentOffset.x = 0
    case 2:
      scrollView.contentOffset.x = 20
//      underSeparatorHeightConst.constant = 40
//      compareView.isHidden = false
      self.view.layoutIfNeeded()
    case 3:
      scrollView.contentOffset.x = 20
    default:
      scrollView.contentOffset.x = 45
    }
  }
  
  
}
