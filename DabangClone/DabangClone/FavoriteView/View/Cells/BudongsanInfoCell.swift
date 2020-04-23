//
//  BudongsanInfoCell.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class BudongsanInfoCell: UITableViewCell {

    static let identifier = "BudongsanInfoCell"
   
    var data: BudongsanInfo! {
        didSet{
            nameLabel.text = data.name
        }
    }
    
    var roomInfoCell = RoomInfoCell()
    
    let nameLabel: UILabel = {
       let label = UILabel()
//        label.text = "다방공인중개사무소"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let roomCountButton: UIButton = {
       let btn = UIButton()
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.backgroundColor = .white
        btn.setTitleColor(.gray, for: .normal)
        btn.setTitle("15개의 방", for: .normal)
        return btn
    }()
    
    let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "brokerProfileImage")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = iv.frame.width / 2
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let separatorLine: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
//    let overralContainer: UIView = {
//       let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(info: BudongsanInfo) {
        roomInfoCell.data = dummyRoom2
        self.data = info
    }
    
    private func configure() {
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        contentView.backgroundColor = .white
        let roomInfoView = roomInfoCell.overralContainerView
        
        contentView.addSubviews([nameLabel, roomCountButton, profileImageView, separatorLine, roomInfoView])
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        roomCountButton.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.bottom.equalTo(profileImageView.snp.bottom)
            $0.width.equalTo(100)
        }
        profileImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(70)
        }
        separatorLine.snp.makeConstraints {
            $0.top.equalTo(roomCountButton.snp.bottom).offset(10)
            $0.leading.equalTo(roomCountButton)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        roomInfoView.snp.makeConstraints {
            $0.top.equalTo(separatorLine.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
//            $0.height.equalTo(150)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }

}
