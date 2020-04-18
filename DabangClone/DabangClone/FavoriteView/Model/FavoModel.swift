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

// MARK: - Room
struct RoomInfo: Codable {
    let id: Int
    let roomDescription: String
    let floor: String
    let totalFloor: String
    let areaInt: Int?
    let areaChar: String
    let supplyAreaInt: Int
    let supplyAreaChar: String
    let shortRent: Bool
    let parkingDetail: String
    let parkingTF: Bool
    let livingExpenses: String
    let livingExpensesDetail: String
    let moveInChar: String
    let moveInDate: String?
    let heatingType: String
    let pet, elevator: Bool
    let multiFloor, pointRoom: String?
    let builtIn, veranda, depositLoan: Bool
    let broker, salesForm: String
    let management, option, securitySafety: [String]
    let address: Address

    enum CodingKeys: String, CodingKey {
        case id
        case roomDescription = "description"
        case floor, totalFloor, areaInt, areaChar, supplyAreaInt, supplyAreaChar, shortRent, parkingDetail, parkingTF
        case livingExpenses = "living_expenses"
        case livingExpensesDetail = "living_expenses_detail"
        case moveInChar = "MoveInChar"
        case moveInDate, heatingType, pet, elevator, multiFloor, pointRoom, builtIn, veranda, depositLoan, broker, salesForm, management, option, securitySafety, address
    }
}

// MARK: - Address
struct Address: Codable {
    let id: Int
    let loadAddress: String
    let detailAddress: String
}
