
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let shoot = try? newJSONDecoder().decode(Shoot.self, from: jsonData)

import Foundation

// MARK: - DabangTinyElement
struct DabangTinyElement: Codable {
    let pk: Int
    let type: DabangTinyType?
    let dabangTinyDescription: String?
    let address: Addresss?
    let lng, lat: Double?
    let salesForm: SalesFormm?
    let pet, elevator, veranda, depositLoan: Bool?
    let postimage: [String]
    let complex: Complexx?

    enum CodingKeys: String, CodingKey {
        case pk, type
        case dabangTinyDescription = "description"
        case address, lng, lat, salesForm, pet, elevator, veranda, depositLoan, postimage, complex
    }
}

// MARK: - Address
struct Addresss: Codable {
    let pk: Int
    let loadAddress, detailAddress: String?
}

// MARK: - Complex
struct Complexx: Codable {
    let pk: Int
    let complexName: String
}

// MARK: - SalesForm
struct SalesFormm: Codable {
    let pk: Int
    let type: SalesFormType
    let depositChar, monthlyChar: String
    let depositInt, monthlyInt: Int
}

enum SalesFormTypee: String, Codable {
    case 매매 = "매매"
    case 월세 = "월세"
    case 전세 = "전세"
}

enum DabangTinyType: String, Codable {
    case 쓰리룸 = "쓰리룸"
    case 아파트 = "아파트"
    case 오피스텔 = "오피스텔"
    case 원룸 = "원룸"
    case 원룸복층 = "원룸(복층)"
    case 원룸주방분리형15룸 = "원룸(주방 분리형(1.5룸))"
    case 투 = "\"투\""
    case 투룸 = "투룸"
}
