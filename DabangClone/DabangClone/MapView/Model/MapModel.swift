//
//  MapModel.swift
//  DabangClone
//
//  Created by 정의석 on 2020/05/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

struct BangInCurrentMapModel: Codable {
    let pk: Int
    let type: BangInCurrentMapType
    let bangInCurrentMapDescription: String
    let address: AddressM
    let lng, lat: Double
    let salesForm: SalesFormM
    let pet, elevator, veranda, depositLoan: Bool
    let postimage: [String]
    let complex: ComplexM?

    enum CodingKeys: String, CodingKey {
        case pk, type
        case bangInCurrentMapDescription = "description"
        case address, lng, lat, salesForm, pet, elevator, veranda, depositLoan, postimage, complex
    }
}

// MARK: - Address
struct AddressM: Codable {
    let pk: Int
    let loadAddress: String
    let detailAddress: JSONNull?
}

// MARK: - Complex
struct ComplexM: Codable {
    let pk: Int
    let complexName: String
}

// MARK: - SalesForm
struct SalesFormM: Codable {
    let pk: Int
    let type: SalesFormTypeM
    let depositChar, monthlyChar: String
    let depositInt, monthlyInt: Int
}

enum SalesFormTypeM: String, Codable {
    case 매매 = "매매"
    case 월세 = "월세"
    case 전세 = "전세"
}

enum BangInCurrentMapType: String, Codable {
    case 원룸 = "원룸"
    case 투룸 = "투룸"
    case 쓰리룸 = "쓰리룸"
    case 아파트 = "아파트"
    case 오피스텔 = "오피스텔"
}
