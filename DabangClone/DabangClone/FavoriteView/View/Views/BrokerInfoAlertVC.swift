//
//  AlertView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class BrokerInfoAlertVC: UIViewController {

    let containerView = UIView()
    let brokerOfficeNameLabel: UILabel = {
       let label = UILabel()
        label.text = "다방공인중개사무소"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    let brokerNameLabel: UILabel = {
       let label = UILabel()
        label.text = "혜리"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let halfView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9314877391, green: 0.9652816653, blue: 0.9995191693, alpha: 1)
        return view
    }()
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.image = UIImage(named: "addProfileImage")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let roomIDLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "매물번호 12345678"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.2740633488, green: 0.5106971264, blue: 1, alpha: 1)
        return label
    }()
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "중개사와의 거래 시 중개수수료가 발생합니다."
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    let closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
       return btn
    }()
    
    let reserveButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "reserve"), for: .normal)
        btn.addTarget(self, action: #selector(handleButtons(_:)), for: .touchUpInside)
       return btn
    }()
    
    let phoneButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "phone"), for: .normal)
       return btn
    }()
    
    lazy var buttonStackView = UIStackView(arrangedSubviews: [reserveButton,phoneButton])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        configureContainerView()
        setAddingSubViews()
        setConstraints()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(350)
        }
    }
    
    private func setAddingSubViews() {
        containerView.addSubview(halfView)
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 1
        containerView.addSubviews([closeButton,brokerOfficeNameLabel,brokerNameLabel,
                                   roomIDLabel,noticeLabel, buttonStackView,profileImageView])
    }
    
    private func setConstraints() {
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(20)
        }
        halfView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.55)
        }
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
        noticeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-30)
        }
        roomIDLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(noticeLabel.snp.top).offset(-5)
        }
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(60)
            $0.top.equalTo(halfView.snp.top).offset(-28)
        }
        brokerOfficeNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(40)
        }
        brokerNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(brokerOfficeNameLabel.snp.bottom).offset(5)
        }
    }
    
    func set(brokerData: Room) {
        
    }
    
    @objc private func handleButtons(_ sender: UIButton) {
        switch sender {
        case reserveButton:
            let url = URL(string: "sms:010-9999-9999&body=Hello")!
            
            guard UIApplication.shared.canOpenURL(url) else {return}
            UIApplication.shared.open(url)
        default:
            let url = URL(string: "tel:010-9999-9999")!
            
            guard UIApplication.shared.canOpenURL(url) else {return}
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
}
