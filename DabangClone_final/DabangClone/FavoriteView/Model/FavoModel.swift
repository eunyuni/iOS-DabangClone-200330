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
    case checkedDanziInfo([Complex])
    case markedRoomInfo([DabangElement])
    case markedDanziInfo([Complex])
    case budongsanInfo([Broker])
}

