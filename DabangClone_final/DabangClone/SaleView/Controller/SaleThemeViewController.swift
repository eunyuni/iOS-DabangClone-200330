//
//  SaleThemeViewController.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SaleThemeViewController: UIViewController {
  // MARK: - Property
  private let scrollView = UIScrollView().then {
    $0.alwaysBounceHorizontal = true
    $0.backgroundColor = .white
    $0.showsHorizontalScrollIndicator = false
  }
  private let selectButtons = [
    ScrollButton(title: "1,2인가구", tag: 0),
    ScrollButton(title: "역세권", tag: 1),
    ScrollButton(title: "신도시", tag: 2),
    ScrollButton(title: "재개발재건축", tag: 3),
    ScrollButton(title: "대단지", tag: 4),
    ScrollButton(title: "MALL세권", tag: 5),
    ScrollButton(title: "GTX권", tag: 6),
  ]
  private var stackView: UIStackView!
  private let tableView = UITableView().then {
    $0.register(SaleInformationTableViewCell.self, forCellReuseIdentifier: SaleInformationTableViewCell.identifier)
  }
  
  var currentTag = 0 {
    didSet {
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
extension SaleThemeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SaleInformationTableViewCell.identifier, for: indexPath) as! SaleInformationTableViewCell
    
    return cell
  }
  
  
}

extension SaleThemeViewController: ScrollButtonDelegate {
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

