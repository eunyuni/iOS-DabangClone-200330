//
//  IsThereCell.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/01.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class IsThereCell: UITableViewCell {
  
  static let identifier = "isThereCell"
  
    let leftTitle = UILabel().then {
      $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      $0.textColor = .black
      $0.textAlignment = .left
      $0.text = ""
    }
    
    lazy var isThereSegmentControl = UISegmentedControl(items: ["없음", "있음"]).then {
      $0.backgroundColor = .white
      $0.tintColor = UIColor(named: "roomGuideTextColor")
      $0.forcedImplementBackgroundColor()
      $0.layer.borderColor = UIColor.gray.cgColor
      $0.layer.borderWidth = 1
      $0.clipsToBounds = true
      $0.addTarget(self, action: #selector(didTapEnableSegment(_:)), for: .valueChanged)
    }
  
  weak var delegate: InfoCellDelegate?
  
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      setupUI()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
      addSubviews([leftTitle, isThereSegmentControl])
      setupCosntraints()
    }
    private func setupCosntraints() {
      leftTitle.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().inset(20)
      }
      
      isThereSegmentControl.snp.makeConstraints {
        $0.trailing.equalToSuperview().inset(20)
        $0.centerY.equalToSuperview()
        $0.height.equalTo(25)
        $0.width.equalTo(150)
      }
    }
    
    func configure(title: BaseInfo = .빈케이스, AdditionalTitle: AdditionalInfo = .빈케이스) {
      if title != BaseInfo.빈케이스 {
        leftTitle.text = "\(title.setTitle())"
      } else if AdditionalTitle != AdditionalInfo.빈케이스 {
        leftTitle.text = "\(AdditionalTitle.setTitle())"
      }
    }
  
  @objc private func didTapEnableSegment(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 1 && leftTitle.text == "관리비" {
      delegate?.didTapCell(title: leftTitle.text!)
      
    }
    print("segment tap")
  }

  }
