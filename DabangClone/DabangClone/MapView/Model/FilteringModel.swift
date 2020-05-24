//
//  FilteringModel.swift
//  DabangClone
//
//  Created by 정의석 on 2020/05/17.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit

class TemporaryFilterSingleton {
  static let shared = TemporaryFilterSingleton()
  
  var roomType: [UIButton] = []
}

class FilterSingleton {
  static let shared = FilterSingleton()
  
  var roomType: String = ""
  var saleType: String = ""
}

class TemporaryFilterSaleTypeSingleton {
  static let shared = TemporaryFilterSaleTypeSingleton()
  
  var saleType: [UIButton] = []
}
