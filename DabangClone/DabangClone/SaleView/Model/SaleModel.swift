//
//  SaleModel.swift
//  DabangClone
//
//  Created by 은영김 on 2020/05/12.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

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
  let moveIn, developer: String
  let constraintTerm: ConstraintTerm
  let detailPrice, pricePyeong, averPrice: String?
}

struct SaleTiny: Codable {
  let id: Int
  let status: Status
  let detailType: DetailType
  let supplyType: SupplyType
  let salesPrice, name, place, term: String
  let image: [String]
}


enum Brand: String, Codable {
  case e편한세상 = "e편한세상"
  case sK뷰 = "SK뷰"
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

enum ConstraintTerm: String, Codable {
  case empty = "-"
  case 소유권이전등기시까지 = "소유권이전등기시까지"
  case 소유권이전등기일5년 = "소유권이전등기일(5년)"
  case 소유권이전등기일초과시5년 = "소유권이전등기일(초과시 5년)"
  case 입주자로선정된날로부터1년 = "입주자로 선정된 날로부터 1년"
  case 입주자로선정된날로부터1년간 = "입주자로 선정된 날로부터 1년간"
  case 입주자로선정된날로부터3년 = "입주자로 선정된 날로부터 3년"
  case 입주자로선정된날로부터6개월 = "입주자로 선정된 날로부터 6개월"
  case 입주자로선정된날부터6개월 = "입주자로 선정된 날부터 6개월"
  case 전매제한6개월 = "전매제한 6개월"
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
  case gtX권 = "GTX권"
  case 대단지 = "대단지"
  case 분양예정 = "분양예정"
  case 신도시 = "신도시"
  case 역세권 = "역세권"
  case 재개발재건축 = "재개발재건축"
  case 청약중 = "청약중"
}

enum DetailType: String, Codable {
  case 아파트 = "아파트"
  case 오피스텔 = "오피스텔"
}

//struct SaleAll: Codable {
//    let count: Int
//    let next: String
//    let previous: String?
//    let results: [SaleInfo]
//
//  private enum CodingKeys: String, CodingKey {
//    case count
//    case next
//    case previous
//    case results
//  }
//
//  init(from decoder: Decoder) throws {
//    print(#function, "======================================================")
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    print("container")
//    self.count = try container.decode(Int.self, forKey: .count)
//    print("count")
//    self.next = try container.decode(String.self, forKey: .next)
//    print("next")
//    self.previous = try container.decode(String?.self, forKey: .previous)
//    print("previous")
//    self.results = try container.decode([SaleInfo].self, forKey: .results)
//    print("results")
//    print("finished", #function, "============================================")
//
//  }
//}

