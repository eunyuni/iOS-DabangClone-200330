//
//  SaleModel.swift
//  DabangClone
//
//  Created by 은영김 on 2020/05/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

//// MARK: - 분양디테일정보
//struct SaleInfo: Codable {
//    let id: Int
//    let brand: Brand?
//    let thema: Thema?
//    let image: [String]
//    let list: [Int]
//    let status: Status
//    let term, name, place: String
//    let salesType: DetailTypeEnum
//    let salesPrice, totalCitizen, salesCitizen, minMaxFloor: String
//    let complexScale: String
//    let detailType: DetailTypeEnum
//    let constraint: Constraint
//    let area: String
//    let supplyType: SupplyType
//    let constraintArea: ConstraintArea
//    let recruit, builder: String
//    let maxPrice: MaxPrice
//    let moveIn, developer, constraintTerm: String
//    let detailPrice, pricePyeong, averPrice: String?
//}
//
//enum Brand: String, Codable {
//    case 아이파크 = "아이파크"
//    case 푸르지오 = "푸르지오"
//}
//
//enum Constraint: String, Codable {
//    case empty = "-"
//    case 전매가능 = "전매가능"
//    case 전매제한 = "전매제한"
//}
//
//enum ConstraintArea: String, Codable {
//    case empty = "-"
//    case 투기과열지구 = "투기과열지구"
//    case 투기지역 = "투기지역"
//}
//
//enum DetailTypeEnum: String, Codable {
//    case 아파트 = "아파트"
//    case 오피스텔 = "오피스텔"
//}
//
//enum MaxPrice: String, Codable {
//    case empty = "-"
//    case 미적용 = "미적용"
//    case 적용 = "적용"
//}
//
//enum Status: String, Codable {
//    case 모집중 = "모집중"
//    case 분양예정 = "분양예정"
//    case 분양중 = "분양중"
//}
//
//enum SupplyType: String, Codable {
//    case 공공분양 = "공공분양"
//    case 공공임대 = "공공임대"
//    case 민간분양 = "민간분양"
//    case 재개발 = "재개발"
//    case 재건축 = "재건축"
//}
//
//enum Thema: String, Codable {
//    case 신도시 = "신도시"
//    case 역세권 = "역세권"
//    case 재개발재건축 = "재개발재건축"
//    case 청약중 = "청약중"
//}

//typealias Welcome = [SaleInfo]

//// MARK: - 분양리스트
//struct SaleList: Codable {
//    let id: Int
//    let status: Status
//    let detailType: DetailType
//    let supplyType: SupplyType
//    let name, place, term: String
//    let image: [String]
//}
//
//enum DetailType: String, Codable {
//    case 아파트 = "아파트"
//    case 오피스텔 = "오피스텔"
//}

// MARK: - Welcome
struct SaleAll: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [SaleInfo]
}

// MARK: - Result
struct SaleInfo: Codable {
    let id: Int
    let brand: Brand?
    let thema: Thema?
    let image: [String]
    let list: [Int]
    let status: Status
    let term, name, place: String
    let salesType: DetailTypeEnum
    let salesPrice, totalCitizen, salesCitizen, minMaxFloor: String
    let complexScale: String
    let detailType: DetailTypeEnum
    let constraint: Constraint
    let area: String
    let supplyType: SupplyType
    let constraintArea: ConstraintArea
    let recruit, builder: String
    let maxPrice: MaxPrice
    let moveIn, developer, constraintTerm: String
    let detailPrice, pricePyeong, averPrice: String?
}

enum Brand: String, Codable {
    case 아이파크 = "아이파크"
    case 푸르지오 = "푸르지오"
}

enum Constraint: String, Codable {
    case empty = "-"
    case 전매가능 = "전매가능"
    case 전매제한 = "전매제한"
}

enum ConstraintArea: String, Codable {
    case empty = "-"
    case 투기과열지구 = "투기과열지구"
    case 투기지역 = "투기지역"
}

enum DetailTypeEnum: String, Codable {
    case 아파트 = "아파트"
    case 오피스텔 = "오피스텔"
}

enum MaxPrice: String, Codable {
    case empty = "-"
    case 미적용 = "미적용"
    case 적용 = "적용"
}

enum Status: String, Codable {
    case 모집중 = "모집중"
    case 분양예정 = "분양예정"
    case 분양중 = "분양중"
}

enum SupplyType: String, Codable {
    case 공공분양 = "공공분양"
    case 공공임대 = "공공임대"
    case 민간분양 = "민간분양"
    case 재개발 = "재개발"
    case 재건축 = "재건축"
}

enum Thema: String, Codable {
    case 신도시 = "신도시"
    case 역세권 = "역세권"
    case 재개발재건축 = "재개발재건축"
    case 청약중 = "청약중"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
