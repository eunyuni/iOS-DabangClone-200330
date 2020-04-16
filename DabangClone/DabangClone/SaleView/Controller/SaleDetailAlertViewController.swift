//
//  SaleDetailAlertViewController.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/15.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class SaleDetailAlertViewController: UIViewController {
  
  // MARK: - Property
  private lazy var backdropView = UIView(frame: self.view.bounds).then {
    $0.backgroundColor = UIColor.black.withAlphaComponent(0.8)
  }
  private let menuView = UIView()
  private let menuHeight: CGFloat = UIScreen.main.bounds.height / 2.5
  private var isPresenting = false
  private let mainImage = UIImageView().then {
    $0.image = UIImage(named: "AlertImage")
  }
  private let titleLabel = UILabel().then {
    $0.text = "분양일정 알림 설정"
    $0.font = .systemFont(ofSize: 15, weight: .bold)
  }
  private let subTitleLabel = UILabel().then {
    $0.text = "분양일정을 선택하면 알림을 보내드립니다."
    $0.font = .systemFont(ofSize: 15, weight: .regular)
  }
  private let commentLabel = UILabel().then {
    $0.text = "! 마케팅 정보 수신에 동의한 경우만 수신 가능합니다."
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.textColor = UIColor(named: "regulationColor")
  }
  private let blueLable = UILabel().then {
    $0.text = "모집공고"
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .white
    $0.backgroundColor = UIColor(named: "roomGuideTextColor")
    $0.layer.cornerRadius = 4
    $0.textAlignment = .center
    $0.layer.masksToBounds = true
  }
  private let cancelButton = UIButton().then {
    $0.setTitle("취소하기", for: .normal)
    $0.setTitleColor(.gray, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
    $0.backgroundColor = UIColor(named: "LightBlueColor")
    $0.layer.borderColor = UIColor.white.cgColor
    $0.layer.borderWidth = 0.5
  }
  private let okButton = UIButton().then {
    $0.setTitle("알림받기", for: .normal)
    $0.setTitleColor(UIColor(named: "regulationColor"), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    $0.backgroundColor = UIColor(named: "LightBlueColor")
    $0.layer.borderColor = UIColor.white.cgColor
    $0.layer.borderWidth = 0.5
  }
  
  
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
  @objc private func didTapCancelButton(_ sender: UIButton){
    dismiss(animated: true, completion: nil)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.view.backgroundColor = .clear
    self.view.addSubviews([backdropView, menuView])
    self.menuView.addSubviews([
    mainImage,
    titleLabel,
    subTitleLabel,
    commentLabel,
    blueLable,
    cancelButton,
    okButton,
    
    
    ])
    
    cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    setupConstraint()
  }
  // MARK: - setupConstraint
  private func setupConstraint() {
    menuView.backgroundColor = .white
    menuView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.centerY.equalToSuperview()
      $0.height.equalTo(menuHeight)
    }
    mainImage.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().offset(30)
    }
    titleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(mainImage.snp.bottom).offset(14)
    }
    subTitleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
    }
    commentLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(6)
    }
    blueLable.snp.makeConstraints {
      $0.top.equalTo(commentLabel.snp.bottom).offset(36)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.height.equalTo(40)
    }
    cancelButton.snp.makeConstraints {
      $0.leading.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
      $0.height.equalTo(60)
    }
    okButton.snp.makeConstraints {
      $0.trailing.bottom.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
      $0.height.equalTo(cancelButton)
    }
  }
}


extension SaleDetailAlertViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
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
      UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
        self.menuView.frame.origin.y -= self.menuHeight
        self.backdropView.alpha = 1
      }, completion: { (finished) in
        transitionContext.completeTransition(true)
      })
    } else {
      UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
        self.menuView.frame.origin.y += self.menuHeight
        self.backdropView.alpha = 0
      }, completion: { (finished) in
        transitionContext.completeTransition(true)
      })
    }
  }
}

