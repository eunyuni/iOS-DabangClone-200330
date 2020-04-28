//
//  NewComplexModel.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/29.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

// 단지 모델
struct Complex: Codable {
    let pk: Int
    let complexName, buildDate, totalCitizen, personalPark: String
    let totalNumber, heatingSystem, minMaxFloor, buildingType: String
    let constructionCompany, fuel, complexType, floorAreaRatio: String
    let dryWasteRate, complexSale, complexPrice, areaSale: String
    let areaPrice: String
    let image: [String]
    let list: [Int]
    let countPost: Int
}
