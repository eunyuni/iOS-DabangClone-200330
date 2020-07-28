//
//  CustomMarker.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import GoogleMaps

class CustomMarker: GMSMarker {
  
  var label: UILabel!
  
  init(labelText: String) {
    super.init()
    
    let iconView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
    iconView.backgroundColor = #colorLiteral(red: 0.1531040967, green: 0.6292726398, blue: 1, alpha: 1)
    label = UILabel()
    label.text = labelText
    label.textColor = .white
    iconView.addSubview(label)
    label.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = 25
    self.iconView = iconView
    
  }
}
