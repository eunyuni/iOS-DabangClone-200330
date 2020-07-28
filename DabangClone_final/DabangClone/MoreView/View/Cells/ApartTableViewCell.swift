//
//  ApartTableViewCell.swift
//  ExpandableTableViewExample
//
//  Created by 정의석 on 2020/04/19.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class ApartTableViewCell: UITableViewCell {
   static let identifier = "Apart"

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
      backgroundColor = .red
      setupConstraints()
    }
    private func setupConstraints() {
      
    }

  }
