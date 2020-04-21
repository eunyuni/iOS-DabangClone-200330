////
////  Model.swift
////  DabangClone
////
////  Created by 정의석 on 2020/04/21.
////  Copyright © 2020 pandaman. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let broker: Broker?
//    let type: WelcomeType
//    let welcomeDescription: String
//    let address: Address?
//    let salesForm: SalesForm?
//    let floor, totalFloor, areaChar: String
//    let supplyAreaInt: Int
//    let supplyAreaChar: String
//    let shortRent: Bool?
//    let managementSet: [ManagementSet]
//    let parkingDetail: ParkingDetail
//    let parkingtf: Bool
//    let livingExpenses: String?
//    let livingExpensesDetail: LivingExpensesDetail?
//    let moveInChar: MoveInChar
//    let moveInDate: JSONNull?
//    let optionSet: [OptionSet]
//    let heatingType: HeatingType
//    let pet, elevator, builtIn, veranda: Bool
//    let depositLoan: Bool
//    let totalCitizen: String?
//    let totalPark: TotalPark?
//    let complete: String?
//    let securitySafetySet: [SecuritySafetySet]
//
//    enum CodingKeys: String, CodingKey {
//        case broker, type
//        case welcomeDescription = "description"
//        case address, salesForm, floor, totalFloor, areaChar, supplyAreaInt, supplyAreaChar, shortRent
//        case managementSet = "management_set"
//        case parkingDetail
//        case parkingtf = "parkingTF"
//        case livingExpenses = "living_expenses"
//        case livingExpensesDetail = "living_expenses_detail"
//        case moveInChar = "MoveInChar"
//        case moveInDate
//        case optionSet = "option_set"
//        case heatingType, pet, elevator, builtIn, veranda, depositLoan, totalCitizen, totalPark, complete
//        case securitySafetySet = "securitySafety_set"
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseAddress { response in
////     if let address = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Address
//struct Address: Codable {
//    let loadAddress: String
//    let detailAddress: JSONNull?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseBroker { response in
////     if let broker = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Broker
//struct Broker: Codable {
//    let name, address, manager, tel: String
//}
//
//enum HeatingType: String, Codable {
//    case 개별난방 = "개별난방"
//    case 지역난방 = "지역난방"
//}
//
//enum LivingExpensesDetail: String, Codable {
//    case empty = "(-)"
//    case 관리비 = "(관리비)"
//    case 관리비주차비 = "(관리비 + 주차비)"
//    case 월세 = "(월세)"
//    case 월세관리비 = "(월세 + 관리비)"
//    case 월세관리비주차비 = "(월세 + 관리비 + 주차비)"
//    case 월세주차비 = "(월세 + 주차비)"
//    case 주차비 = "(주차비)"
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseManagementSet { response in
////     if let managementSet = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - ManagementSet
//struct ManagementSet: Codable {
//    let postRoom, admin: Int
//    let totalFee: Double
//}
//
//enum MoveInChar: String, Codable {
//    case the08대 = "0.8대"
//    case the20200217 = "2020.02.17"
//    case the20200301 = "2020.03.01"
//    case the20200313 = "2020.03.13"
//    case the20200323 = "2020.03.23"
//    case the20200330 = "2020.03.30"
//    case the20200422 = "2020.04.22"
//    case the20200425 = "2020.04.25"
//    case the20200510 = "2020.05.10"
//    case the20200511 = "2020.05.11"
//    case the20211231 = "2021.12.31"
//    case 날짜협의 = "날짜 협의"
//    case 없음 = "없음"
//    case 있음 = "있음"
//    case 즉시입주 = "즉시 입주"
//}
////있음없음이 뭐지?
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseOptionSet { response in
////     if let optionSet = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - OptionSet
//struct OptionSet: Codable {
//    let postRoom, option: Int
//    let createdAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case postRoom, option
//        case createdAt = "created_at"
//    }
//}
//
//enum ParkingDetail: String, Codable {
//    case the1만원 = "1만 원"
//    case the2만원 = "2만 원"
//    case the3만원 = "3만 원"
//    case the4만원 = "4만 원"
//    case the5만원 = "5만 원"
//    case 가능무료 = "가능(무료)"
//    case 문의 = "문의"
//    case 불가 = "불가"
//}
////한 번 더 갑시다~!
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSalesForm { response in
////     if let salesForm = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - SalesForm
//struct SalesForm: Codable {
//    let type: SalesFormType
//    let depositChar, monthlyChar: String
//    let depositInt, monthlyInt: Int
//}
//
//enum SalesFormType: String, Codable {
//    case 매매 = "매매"
//    case 월세 = "월세"
//    case 전세 = "전세"
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSecuritySafetySet { response in
////     if let securitySafetySet = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - SecuritySafetySet
//struct SecuritySafetySet: Codable {
//    let postRoom, security: Int
//    let createdAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case postRoom, security
//        case createdAt = "created_at"
//    }
//}
//
//enum TotalPark: String, Codable {
//    case empty = "-"
//    case the07대 = "0.7대"
//    case the08대 = "0.8대"
//    case the11대 = "1.1대"
//    case the12대 = "1.2대"
//    case the13대 = "1.3대"
//    case the15대 = "1.5대"
//    case the16대 = "1.6대"
//    case the17대 = "1.7대"
//    case the18대 = "1.8대"
//    case the1대 = "1대"
//    case the65대 = "6.5대"
//}
//
//enum WelcomeType: String, Codable {
//    case 쓰리룸 = "쓰리룸"
//    case 아파트 = "아파트"
//    case 오피스텔 = "오피스텔"
//    case 원룸 = "원룸"
//    case 원룸복층 = "원룸(복층)"
//    case 원룸주방분리형15룸 = "원룸(주방 분리형(1.5룸))"
//    case 투룸 = "투룸"
//}
//
//typealias Welcome = [WelcomeElement]
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - Alamofire response handlers
//
//extension DataRequest {
//    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
//        return DataResponseSerializer { _, response, data, error in
//            guard error == nil else { return .failure(error!) }
//
//            guard let data = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//
//            return Result { try newJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//
//    @discardableResult
//    func responseWelcome(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Welcome>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//
//// MARK: - Encode/decode helpers
//
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
