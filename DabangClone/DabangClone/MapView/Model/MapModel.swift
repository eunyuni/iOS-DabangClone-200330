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
        let name: String?
        let supplyAreaInt: Int
        let dabangDescription: String
        let address: AddressM
        let floor, areaChar: String
        let lng, lat: Double
        let salesForm: SalesFormM
        let pet, elevator, veranda, depositLoan: Bool
        let postimage: [String]
        let optionSet: [OptionSet]
        let complex: ComplexM?

        enum CodingKeys: String, CodingKey {
          case pk, type, name, supplyAreaInt, floor, areaChar
            case dabangDescription = "description"
            case address, lng, lat, salesForm, pet, elevator, veranda, depositLoan, postimage, complex
          case optionSet
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
        case 쓰리룸 = "쓰리룸"
        case 아파트 = "아파트"
        case 오피스텔 = "오피스텔"
        case 원룸 = "원룸"
        case 원룸복층 = "원룸(복층)"
        case 원룸주방분리형15룸 = "원룸(주방 분리형(1.5룸))"
        case 투룸 = "투룸"
    }
