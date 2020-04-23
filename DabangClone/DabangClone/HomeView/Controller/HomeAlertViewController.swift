//
//  HomeAlertViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/22.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class HomeAlertViewController: UIViewController {
  
  private let firsAlertView = UIView().then {
    $0.backgroundColor = .white
  }
  private let mascotImage = UIImageView().then {
//    $0.contentMode = .scaleAspectFit
    $0.image = UIImage(named: "DabangMascot")
  }
  private let cancelButton = UIButton().then {
    $0.setImage(UIImage(systemName: "xmark"), for: .normal)
    $0.tintColor = .white
    //    $0.addTarget(self, action: #selector(didTapButtonsAction(_:)), for: .touchUpInside)
  }
  private let leftButton = UIButton().then {
    $0.setTitle("오늘 하루 보지 않기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(didTapleftButton(_:)), for: .touchUpInside)
  }
  
  private let detailButton = UIButton().then {
    $0.setTitle("자세히 보기", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 17)
//    $0.addTarget(self, action: #selector(didTapleftButton(_)), for: .touchUpInside)
  }
  
  private let menuHeight = UIScreen.main.bounds.height / 2
  private var isPresenting = false
  
  
  // MARK: - Lift cycle
//  init() {
//    super.init(nibName: nil, bundle: nil)
//    modalPresentationStyle = .custom
//    transitioningDelegate = self
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    //    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
    cancelButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    setupUI()
  }
  // MARK: - Action
  @objc private func didTapGesture(_ sender: UITapGestureRecognizer) {
    dismiss(animated: true, completion: nil)
  }
  @objc private func didTapButton(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  @objc private func didTapleftButton(_ sender: UIButton) {
//    _ = UserDefaults.standard.integer(forKey: "TodayPopUp")
    UserDefaults.standard.set(checkToday(), forKey: "TodayPopUp")
    self.dismiss(animated: true, completion: nil)
  }
  // MARK: - setupUI
  private func setupUI() {
    
    self.view.addSubviews([
      firsAlertView,
      cancelButton,
      leftButton,
    ])
    firsAlertView.addSubviews([
      mascotImage,
      detailButton,
    ])
    
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    firsAlertView.snp.makeConstraints {
      $0.center.equalTo(self.view)
      $0.width.equalTo(self.view.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
      $0.height.equalTo(self.view.safeAreaLayoutGuide.snp.height).multipliedBy(0.64)
    }
    mascotImage.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(460)
    }
    leftButton.snp.makeConstraints {
      $0.leading.equalTo(firsAlertView)
      $0.bottom.equalTo(firsAlertView.snp.top).offset(-2)
    }
    cancelButton.snp.makeConstraints {
//      $0.bottom.equalTo(leftButton)
      $0.centerY.equalTo(leftButton)
      $0.trailing.equalTo(firsAlertView)
    }
    detailButton.snp.makeConstraints {
      $0.top.equalTo(mascotImage.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
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
  //extension HomeAlertViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
  //  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
  //    return self
  //  }
  //
  //  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
  //    return self
  //  }
  //
  //  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
  //    return 1
  //  }
  
  //  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
  //    let containerView = transitionContext.containerView
  //    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
  //    guard let toVC = toViewController else { return }
  //    isPresenting = !isPresenting
  //
  //    if isPresenting == true {
  //      containerView.addSubview(toVC.view)
  //
  //      menuView.frame.origin.y += menuHeight
  //      backdropView.alpha = 0
  //
  //      UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
  //        self.menuView.frame.origin.y -= self.menuHeight
  //        self.backdropView.alpha = 1
  //      }, completion: { (finished) in
  //        transitionContext.completeTransition(true)
  //      })
  //    } else {
  //      UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
  //        self.menuView.frame.origin.y += self.menuHeight
  //        self.backdropView.alpha = 0
  //      }, completion: { (finished) in
  //        transitionContext.completeTransition(true)
  //      })
  //    }
  //  }
  //}
  

