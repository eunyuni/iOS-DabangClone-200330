//
//  SaleNewsTableViewCell.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/08.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

protocol SaleNewsTableViewCellDelegate: class {
  func didTapMoreButton()
}

class SaleNewsTableViewCell: UITableViewCell {
  // MARK: - Identifier
  static let identifier = "SaleNewsTableViewCell"
  
  weak var delegate: SaleNewsTableViewCellDelegate?
  
  // MARK: - Property
  private let titleLabel = UILabel().then {
    $0.text = "분양 뉴스"
    $0.font = .systemFont(ofSize: 18)
  }
  private let button = UIButton().then {
    $0.setTitle("더보기 >", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.setTitleColor(.blue, for: .normal)
  }
  private let leftView = ImageNewsView().then {
    $0.configue(imageName: "newsImage", title: "정책", detail: "서울시 도시철도 9호선 4단계 국토교통부 기본계 어쩌구 저쩌구")
  }
  private let rightView = ImageNewsView().then {
    $0.configue(imageName: "newsImage", title: "정책", detail: "서울시 도시철도 9호선 4단계 국토교통부 기본계 어쩌구 저쩌구")
  }
  private let firstNewsView = NewsView().then {
    $0.configue(title: "정책", detail: "\"껑충 뛴 공시가 낮춰달라\"…이의신청 2만건 넘어설 듯")
  }
  private let secondNewsView = NewsView().then {
    $0.configue(title: "동향", detail: "수원 영통 집값 39주만에 보합...서울 자치구 절반이상 하락세로")
  }
  private let thirdNewsView = NewsView().then {
    $0.configue(title: "정책", detail: "서울 절반이 집값 '마이너스'... 14개 매매가 하락")
  }
  private let firstLineView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  private let secondLineView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  private let thirdLineView = UIView().then {
    $0.backgroundColor = UIColor(named: "TextFieldColor")
  }
  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  @objc private func didTapButton(_ sender: UIButton){
    delegate?.didTapMoreButton()
  }
  
  // MARK: - setupUI
  private func setupUI() {
    self.contentView.addSubviews([titleLabel, button, leftView, rightView, firstNewsView, secondNewsView, thirdNewsView, firstLineView, secondLineView, thirdLineView])
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(15)
    }
    button.snp.makeConstraints {
      $0.centerY.equalTo(titleLabel.snp.centerY)
      $0.trailing.equalToSuperview().inset(15)
    }
    leftView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.leading.equalToSuperview().offset(15)
      $0.trailing.equalTo(self.contentView.snp.centerX).offset(-7)
      $0.height.equalTo(160)
    }
    rightView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(12)
      $0.leading.equalTo(self.contentView.snp.centerX).offset(7)
      $0.trailing.equalToSuperview().offset(-15)
      $0.height.equalTo(160)
    }
    firstLineView.snp.makeConstraints {
      $0.top.equalTo(leftView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(1)
    }
    firstNewsView.snp.makeConstraints {
      $0.top.equalTo(firstLineView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(40)
    }
    secondLineView.snp.makeConstraints {
      $0.top.equalTo(firstNewsView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(1)
    }
    secondNewsView.snp.makeConstraints {
      $0.top.equalTo(secondLineView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(40)
    }
    thirdLineView.snp.makeConstraints {
      $0.top.equalTo(secondNewsView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(1)
    }
    thirdNewsView.snp.makeConstraints {
      $0.top.equalTo(thirdLineView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(15)
      $0.height.equalTo(40)
      $0.bottom.equalToSuperview()
    }
  }
  
}


class ImageNewsView : UIView{
  // MARK: - Property
  private let imageView = UIImageView()
  private let titleLabel = UILabel().then {
    $0.numberOfLines = 0
    //    $0.lineBreakMode = .byWordWrapping
  }
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Action
  func configue(imageName: String, title: String, detail: String) {
    imageView.image = UIImage(named: imageName)
    titleLabel.attributedText = NSMutableAttributedString().bold(title + " ", fontSize: 15).normal(detail, fontSize: 15)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([imageView,titleLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(100)
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(10)
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-12)
    }
  }
}



class NewsView: UIView {
  // MARK: - Property
  private let titleLabel = UILabel()
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Action
  func configue(title: String, detail: String) {
    titleLabel.attributedText = NSMutableAttributedString().bold(title + " ", fontSize: 15).normal(detail, fontSize: 15)
  }
  // MARK: - setupUI
  private func setupUI() {
    self.addSubviews([titleLabel])
    setupConstraint()
  }
  
  // MARK: - setupConstraint
  private func setupConstraint() {
    titleLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
    }
  }
}

