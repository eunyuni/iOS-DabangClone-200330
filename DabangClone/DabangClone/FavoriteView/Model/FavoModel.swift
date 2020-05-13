//
//  Model.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/04.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit

enum FavoriteData {
    case checkedRoomInfo([DabangElement])
    case checkedDanziInfo([DanziInfo])
    case markedRoomInfo([DabangElement])
    case markedDanziInfo([DanziInfo])
    case budongsanInfo([Broker])
}

struct DanziInfo {
    var name: String
    var availableRoomCount: Int
    let image: UIImage
    let type: String
    let numberOfhouseholds: Int
    let completeYear: String
    let address: String
}

let dummyDanzi = DanziInfo(name: "위브더스테이트2단지", availableRoomCount: 10, image: #imageLiteral(resourceName: "SampleImage"), type: "아파트", numberOfhouseholds: 71, completeYear: "2006.09", address: "경기도 부천시 중동")

struct BudongsanInfo {
    var name: String
    var relatedRoomNumber: Int
}

let dummyBudongsan = BudongsanInfo(name: "다방공인중개사무소", relatedRoomNumber: 2039)
let dummyBudongsan2 = BudongsanInfo(name: "다방공인중개사무소", relatedRoomNumber: 2031)

