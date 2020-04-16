//
//  SaleAreaViewController.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class SaleAreaViewController: UIViewController {
  private lazy var backdropView = UIView(frame: self.view.bounds).then {
    $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
  }
  
  private let menuView = UIView()
  private let menuHeight = UIScreen.main.bounds.height / 1.77
  private var isPresenting = false
  
  private let topLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16)
    $0.text = "지역선택(시/도)"
  }
  private let cancelButton = UIButton().then {
    $0.setImage(UIImage(systemName: "multiply")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
  }
  private let okButton = UIButton().then {
    $0.setTitle("확인", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
  }
  private let lineView = UIView().then {
    $0.backgroundColor = .black
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    
    $0.backgroundColor = .white
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
    $0.register(SaleAreaCollectionViewCell.self, forCellWithReuseIdentifier: SaleAreaCollectionViewCell.identifier)
  }
  
  private let areaDatas = ["전국" , "서울특별시" , "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"]
  // MARK: - Lift cycle
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
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
    backdropView.addGestureRecognizer(tapGesture)
    setupUI()
  }
  // MARK: - Action
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: - setupUI
  private func setupUI() {
    self.view.backgroundColor = .clear
    print("Check")
    collectionView.dataSource = self
    collectionView.delegate = self
    self.view.addSubviews([backdropView, menuView])
    self.menuView.addSubviews([topLabel, okButton,lineView, cancelButton,collectionView])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    menuView.backgroundColor = .white
    menuView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(menuHeight)
    }
    topLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(18)
    }
    okButton.snp.makeConstraints {
      $0.centerY.equalTo(topLabel.snp.centerY)
      $0.trailing.equalToSuperview().offset(-8)
    }
    cancelButton.snp.makeConstraints {
      $0.centerY.equalTo(topLabel.snp.centerY)
      $0.leading.equalToSuperview().offset(8)
      $0.height.width.equalTo(topLabel.snp.height).multipliedBy(1.1)
    }
    lineView.snp.makeConstraints {
      $0.top.equalTo(topLabel.snp.bottom).offset(18)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(2)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension SaleAreaViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 1
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    guard let toVC = toViewController else { return }
    isPresenting = !isPresenting
    
    if isPresenting == true {
      containerView.addSubview(toVC.view)
      
      menuView.frame.origin.y += menuHeight
      backdropView.alpha = 0
      
      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
        self.menuView.frame.origin.y -= self.menuHeight
        self.backdropView.alpha = 1
      }, completion: { (finished) in
        transitionContext.completeTransition(true)
      })
    } else {
      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
        self.menuView.frame.origin.y += self.menuHeight
        self.backdropView.alpha = 0
      }, completion: { (finished) in
        transitionContext.completeTransition(true)
      })
    }
  }
}



extension SaleAreaViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("check")
    print(areaDatas.count)
    return areaDatas.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleAreaCollectionViewCell.identifier, for: indexPath ) as! SaleAreaCollectionViewCell
    cell.configue(title: areaDatas[indexPath.item])
    print(areaDatas[indexPath.item])
    return cell
  }
}

extension SaleAreaViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.width - 30) / 3, height: (collectionView.frame.height - 48) / 6)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 24
    return UIEdgeInsets(top: margin, left: 15, bottom: margin, right: 15)
  }
}

extension SaleAreaViewController: UICollectionViewDelegate {
  
}
