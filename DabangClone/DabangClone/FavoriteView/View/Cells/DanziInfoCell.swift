//
//  DanziInfoCell.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class DanziInfoCell: UITableViewCell {
    static let identifier = "DanziInfoCell"
    
    var data: DanziInfo! {
        didSet {
            nameLabel.text = data.name
            infoLabel.text = data.type + ", " + "\(data.numberOfhouseholds)" + ", " + data.completeYear
            addressLabel.text = data.address
            danziImageView.image = data.image
            availableRoomButton.setAttributedTitle(makeAttributeString(availableRoomCount: data.availableRoomCount), for: .normal)
        }
    }
    
    let overralContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    let addressLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .lightGray
        return label
    }()

    let danziImageView: UIImageView = {
       let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var availableRoomButton: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.8765594363, green: 0.8766859174, blue: 0.876531899, alpha: 1)
        btn.addTarget(self, action: #selector(didTapButtons(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var danziInfoButton: UIButton = {
       let btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        btn.addTarget(self, action: #selector(didTapButtons(_:)), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0.8765594363, green: 0.8766859174, blue: 0.876531899, alpha: 1)
        btn.setTitle("단지정보", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    let verticalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let buttonSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var buttonStackView = UIStackView(arrangedSubviews: [availableRoomButton, danziInfoButton])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
        [verticalSeparator, overralContainerView, buttonStackView].forEach({contentView.addSubview($0)})
        buttonStackView.distribution = .fillEqually
        overralContainerView.addSubviews([nameLabel, infoLabel, addressLabel, danziImageView])
        contentView.addSubview(buttonSeparator)
    }
    
    private func setConstraints() {
        buttonSeparator.snp.makeConstraints {
            $0.width.equalTo(0.5)
        }
        overralContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(verticalSeparator.snp.top)
        }
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(6)
            $0.leading.equalTo(nameLabel)
        }
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(45)
        }
        danziImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.bottom.equalTo(verticalSeparator.snp.top).offset(-10)
            
        }
        verticalSeparator.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(buttonStackView.snp.top)
            $0.height.equalTo(0.5)
        }
        buttonSeparator.snp.makeConstraints {
            $0.top.bottom.equalTo(buttonStackView)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(danziInfo: DanziInfo) {
        self.data = danziInfo
    }
    
    func makeAttributeString(availableRoomCount: Int) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: "거래 가능한 방", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor : UIColor.black])
        let countString = " \(availableRoomCount)개"
        let attribute = NSAttributedString(string: countString, attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .light), .foregroundColor : UIColor.blue])
        attributeString.append(attribute)
        return attributeString
    }
    
    @objc private func didTapButtons(_ sender: UIButton) {
        switch sender {
        case availableRoomButton:
            print("Tap Available")
        default:
            print("Tap DanziInfo")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
    }
}
