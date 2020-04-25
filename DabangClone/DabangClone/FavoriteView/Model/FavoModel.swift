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
    case budongsanInfo([BudongsanInfo])
}


//struct Room: Hashable {
//    var name: String?
//    var image: UIImage
//}
// UserInfo 필요함.
struct UserInfo {
    let userID: String
    let userName: String
    var phoneNumber: String
    var profileImage: UIImage
    var myRoomsToOffer: [RoomInfo]
    var checkedRoomData: [RoomInfo]
    var checkedDanziData: [DanziInfo]
    var markedRoomData: [RoomInfo]
    var markedDanziData: [DanziInfo]
    var contactBudongsanData: [BudongsanInfo]
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
// MARK: - Room
struct RoomInfo: Codable {
    let broker, type, roomDescription, address: String
    let salesForm, floor, totalFloor, areaChar: String
    let supplyAreaInt: Int
    let supplyAreaChar: String
    let shortRent: Bool
    let management: [String]
    let parkingDetail: String
    let parkingTF: Bool
    let livingExpenses, livingExpensesDetail, moveInChar: String
    let moveInDate: Date?
    let option: [String]
    let heatingType: String
    let pet, elevator, builtIn, veranda: Bool
    let depositLoan: Bool
    let totalCitizen, totalPark, complete: String
    let securitySafety: [String]

    enum CodingKeys: String, CodingKey {
        case broker, type
        case roomDescription = "description"
        case address, salesForm, floor, totalFloor, areaChar, supplyAreaInt, supplyAreaChar, shortRent, management, parkingDetail, parkingTF
        case livingExpenses = "living_expenses"
        case livingExpensesDetail = "living_expenses_detail"
        case moveInChar = "MoveInChar"
        case moveInDate, option, heatingType, pet, elevator, builtIn, veranda, depositLoan, totalCitizen, totalPark, complete, securitySafety
    }
}

// MARK: - Address
struct AddressSungJun: Codable {
    let id: Int
    let loadAddress: String
    let detailAddress: String
}
