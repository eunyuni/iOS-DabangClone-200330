//
//  DanziInfoCell.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SDWebImage

protocol DanziInfoCellDelegate: class {
    func didTapAvailableRoomsButtons()
    func didTapComplexInfoButton(data: Complex)
}


class DanziInfoCell: UITableViewCell {
    static let identifier = "DanziInfoCell"
    
    var data: Complex! {
        didSet {
            nameLabel.text = data.complexName
            infoLabel.text = data.buildingType + ", " + "\(data.countPost)" + ", " + data.buildDate
            addressLabel.text = data.totalCitizen
            danziImageView.sd_setImage(with: URL(string: "https://dabang.s3.amazonaws.com/" + (data.image.first ?? "")))
            availableRoomButton.setAttributedTitle(makeAttributeString(availableRoomCount: data.list.count), for: .normal)
        }
    }
    
    weak var delegate: DanziInfoCellDelegate?
    
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
        iv.contentMode = .scaleAspectFill
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
        selectedBackgroundView?.isHidden = true
        overralContainerView.layer.cornerRadius = 5
        overralContainerView.layer.borderWidth = 0.5
        overralContainerView.layer.borderColor = UIColor.lightGray.cgColor
        overralContainerView.clipsToBounds = true
        contentView.addSubview(overralContainerView)
        buttonStackView.distribution = .fillEqually
        overralContainerView.addSubviews([nameLabel, infoLabel, addressLabel, danziImageView,buttonStackView,verticalSeparator])
        overralContainerView.addSubview(buttonSeparator)
    }
    
    private func setConstraints() {
        overralContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
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
        
        danziImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.width.equalToSuperview().multipliedBy(0.38)
            $0.height.equalTo(100)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(danziImageView.snp.bottom).offset(10)
            $0.height.equalTo(50)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        buttonSeparator.snp.makeConstraints {
            $0.top.bottom.equalTo(buttonStackView)
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.width.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(danziInfo: Complex) {
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
            self.data.list.forEach({
                APIManager.shared.getCertainRoomData(pk: $0) { (result) in
                    switch result {
                    case .success(let room):
                        print("success")
                        UserActionTracker.shared.complexAvailableRooms.onNext(room)
                    case .failure(let error):
                        print("failed to load rooms: ", error)
                    }
                }
            })
            self.delegate?.didTapAvailableRoomsButtons()
        default:
            self.delegate?.didTapComplexInfoButton(data: self.data)
        }
    }
}
