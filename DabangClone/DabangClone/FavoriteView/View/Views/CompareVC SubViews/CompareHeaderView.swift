//
//  CompareHeaderView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class CompareHeaderView: UIView {
    
    let roomIDLabel = UILabel()
    let imageView = UIImageView()
    let roomStyleLabel = UILabel()
    let costLabel = UILabel()
    
    let rightSeparatorLine = UIView()
    let underSeparatorLine = UIView()
    
    var data: DabangElement!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    convenience init(data: DabangElement) {
        self.init(frame: .zero)
        self.data = data
        setViewData()
    }
    
    private func setViewData() {
        roomIDLabel.text = "매물번호 \(data.pk)"
        if !data.postimage.isEmpty {
            let url = URL(string: "https://wpsdabangapi.s3.amazonaws.com/\(data.postimage[0])")
            self.imageView.kf.setImage(with: url)
            self.imageView.contentMode = .scaleAspectFill
        }
        roomStyleLabel.text = data.salesForm.type.rawValue
        costLabel.text = data.salesForm.type == .전세 ? data.salesForm.depositChar : data.salesForm.monthlyChar
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        addSubviews([imageView, roomStyleLabel, costLabel, underSeparatorLine, rightSeparatorLine])
        imageView.addSubview(roomIDLabel)
        
        roomIDLabel.backgroundColor = UIColor(white: 0.2, alpha: 0.7)
        roomIDLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        roomIDLabel.textAlignment = .center
        roomIDLabel.textColor = .white
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        roomStyleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        roomStyleLabel.textColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
        roomStyleLabel.textAlignment = .left
        
        costLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        costLabel.textColor = #colorLiteral(red: 0.2596234679, green: 0.5155771971, blue: 0.9926976562, alpha: 1)
        
        underSeparatorLine.backgroundColor = .lightGray
        underSeparatorLine.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(0.8)
        }
        
        rightSeparatorLine.backgroundColor = .lightGray
        rightSeparatorLine.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(0.8)
        }
        
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(imageView.snp.width).multipliedBy(0.6)
        }
        
        costLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(10)
        }
        
        roomStyleLabel.snp.makeConstraints {
            $0.leading.equalTo(costLabel.snp.leading)
            $0.bottom.equalTo(costLabel.snp.top).offset(-3)
        }
        
        roomIDLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.23)
        }
    }
}
