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
    case checkedRoomInfo([Room])
    case checkedDanziInfo([DanziInfo])
    case markedRoomInfo([Room])
    case markedDanziInfo([DanziInfo])
    case budongsanInfo([BudongsanInfo])
}


//struct Room: Hashable {
//    var name: String?
//    var image: UIImage
//}

struct DanziInfo {
    var name: String
}

struct BudongsanInfo {
    var name: String
}
