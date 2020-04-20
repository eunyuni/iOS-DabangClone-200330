//
//  AddressViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
  
  //MARK: - Property
  let grayView = UIView().then {
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 4
  }
  
  let titleLabel = UILabel().then {
    $0.text = "주소는 동, 면, 읍까지만 노출됩니다."
    $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    $0.textAlignment = .center
  }
  
  lazy var findAddressButton = UIButton().then {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.gray.cgColor
    $0.layer.cornerRadius = 2
    $0.setTitle("주소 찾기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.addTarget(self, action: #selector(didTapFindAddressButton), for: .touchUpInside)
  }
  
  let bottomLable = UILabel().then {
    $0.text = "검색해도 주소가 나오지 않는 경우\n고객센터 02-1899-6840으로 문의해주세요."
    $0.numberOfLines = 0
    $0.textColor = .gray
    $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    $0.textAlignment = .center
  }

  
  //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white

      setupUI()
    }
  
  //MARK: - setupUI & setupConstraints
  
  private func setupUI() {
    view.addSubviews([grayView])
    grayView.addSubviews([titleLabel, findAddressButton, bottomLable])
    setupConstraints()
  }
  
  private func setupConstraints() {
    grayView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
    titleLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(50)
    }
    findAddressButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(2)
      $0.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
      $0.height.equalTo(titleLabel)
    }
    
    bottomLable.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(50)
    }
  }
  
  //MARK: - Action
  @objc private func didTapFindAddressButton() {
    let vc = AddressSearchViewController()
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
  }
  
    

}
