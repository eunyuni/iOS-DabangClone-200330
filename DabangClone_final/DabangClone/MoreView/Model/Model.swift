//
//  Model.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/25.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation


struct Question {
  
  let title: String
  let content: String
  var open = false
  
}

struct RoomMenu {
  
  let title: String
  let menus: [String]?
  var open = false
}
class RoomForSale {
  static let shared = RoomForSale()
  
  var roomData: RoomForSaleElement = RoomForSaleElement(type: nil, description: nil, loadAddress: nil, detailAddress: nil, lng: nil, lat: nil, saleFormType: nil, depositChar: nil, monthlyChar: nil, depositInt: nil, monthlyInt: nil, floor: nil, areaChar: nil, supplyAreaInt: nil, supplyAreaChar: nil, shortRent: nil, parkingDetail: nil, parkingTF: nil, living_expenses: nil, living_expenses_detail: nil, moveInChar: nil, moveInDate: nil, heatingType: nil, pet: nil, elevator: nil, builtIn: nil, veranda: nil, depositLoan: nil, totalCitizen: nil, totalPark: nil, complete: nil, option: nil)
  var images: [UIImage] = []
//  private init() {
//    self.roomData = RoomForSaleElement(type: nil, description: nil, loadAddress: nil, detailAddress: nil, lng: nil, lat: nil, saleFormType: nil, depositChar: nil, monthlyChar: nil, depositTnt: nil, monthlyInt: nil, floor: nil, areaChar: nil, supplyAreaInt: nil, supplyAreaChar: nil, shortRent: nil, parkingDetail: nil, parkingTF: nil, living_expenses: nil, living_expenses_detail: nil, moveInChar: nil, moveInDate: nil, heatingType: nil, pet: nil, elevator: nil, builtIn: nil, veranda: nil, depositLoan: nil, totalCitizen: nil, totalPark: nil, complete: nil, option: nil)
//  }
  func reset() {
    self.roomData = RoomForSaleElement(type: nil, description: nil, loadAddress: nil, detailAddress: nil, lng: nil, lat: nil, saleFormType: nil, depositChar: nil, monthlyChar: nil, depositInt: nil, monthlyInt: nil, floor: nil, areaChar: nil, supplyAreaInt: nil, supplyAreaChar: nil, shortRent: nil, parkingDetail: nil, parkingTF: nil, living_expenses: nil, living_expenses_detail: nil, moveInChar: nil, moveInDate: nil, heatingType: nil, pet: nil, elevator: nil, builtIn: nil, veranda: nil, depositLoan: nil, totalCitizen: nil, totalPark: nil, complete: nil, option: nil)
    self.images.removeAll()
  }
  func roomDictionary() -> [String : String] {
    var result: [String: String] = [:]
    result["type"] = self.roomData.type
    result["description"] = self.roomData.description
    result["loadAddress"] = self.roomData.loadAddress
    result["detailAddress"] = self.roomData.detailAddress
    result["lng"] = self.roomData.lng
    result["lat"] = self.roomData.lat
    result["saleFormType"] = self.roomData.saleFormType
    result["depositChar"] = self.roomData.depositChar
    result["monthlyChar"] = self.roomData.monthlyChar
    result["depositInt"] = self.roomData.depositInt
    result["monthlyInt"] = self.roomData.monthlyInt
    result["floor"] = self.roomData.floor
    result["areaChar"] = self.roomData.areaChar
    result["supplyAreaInt"] = self.roomData.supplyAreaInt
    result["supplyAreaChar"] = self.roomData.supplyAreaChar
    result["shortRent"] = self.roomData.shortRent
    result["parkingDetail"] = self.roomData.parkingDetail
    result["parkingTF"] = self.roomData.parkingTF
    result["living_expenses"] = self.roomData.living_expenses
    result["living_expenses_detail"] = self.roomData.living_expenses_detail
    result["moveInChar"] = self.roomData.moveInChar
    result["moveInDate"] = self.roomData.moveInDate
    result["heatingType"] = self.roomData.heatingType
    result["pet"] = self.roomData.pet
    result["elevator"] = self.roomData.elevator
    result["builtIn"] = self.roomData.builtIn
    result["veranda"] = self.roomData.veranda
    result["depositLoan"] = self.roomData.depositLoan
    result["totalCitizen"] = self.roomData.totalCitizen
    result["totalPark"] =  self.roomData.totalPark
    result["complete"] = self.roomData.complete
    result["option"] = self.roomData.option
    return result
  }
}

struct RoomForSaleElement {
  var type: String?
  var description: String?
  var loadAddress: String?
  var detailAddress: String?
  var lng: String?
  var lat: String?
  var saleFormType: String?
  var depositChar: String?
  var monthlyChar: String?
  var depositInt: String?
  var monthlyInt: String?
  var floor: String?
  var areaChar: String?
  var supplyAreaInt: String?
  var supplyAreaChar: String?
  var shortRent: String?
  var parkingDetail: String?
  var parkingTF: String?
  var living_expenses: String?
  var living_expenses_detail: String?
  var moveInChar: String?
  var moveInDate: String?
  var heatingType: String?
  var pet: String?
  var elevator: String?
  var builtIn: String?
  var veranda: String?
  var depositLoan: String?
  var totalCitizen : String?
  var totalPark: String?
  var complete: String?
  var option: String?
}


  var titleArray = ["다방은 어떤 서비스인가요?", "회원가입을 하면 어떤 점이 좋나요?", "회원탈퇴는 어떻게 하나요?", "직거래는 어떻게 방을 내놓나요?", "다방에 등록된 방은 믿을 수 있나요?", "허위매물은 어떻게 관리 하나요?", "매물개수 제한이 있나요?", "공인중개사 연락처 자동저장 기능은 어떻게 해제하나요?"]
  
  var contentArray = [
    """
  국내 최초 오픈형 부동산 플랫폼 ‘다방’에서 살고 싶은 집을 만나보세요.

  [원룸부터 아파트까지. 다 있다! 다방]

  ▶ 대한민국 모든 집! 다 있다.
  원룸, 투∙쓰리룸, 오피스텔, 아파트는 물론! 이제는 분양정보까지!! 월세, 전세, 매매, 분양까지 다~있는 다방에서 다양한 집 정보를 확인하세요.

  ▶ 집에 대한 모든 정보
  매물, 교통, 편의시설 뿐만 아니라 우리아이가 입학하게 될 학군 정보 까지! 집 선택에 필요한 모든 정보를 다방에서 한눈에 확인 할 수 있어요.

  ▶ 꼼꼼해진 다방 맞춤검색
  내가 원하는 조건의 방만 쏙쏙 확인할 수 있도록! 맞춤검색 필터가 더욱 세분화 되었습니다.

  ▶ 다방면스코어
  다방의 매물 빅데이터를 기반으로 한 지역 평균 대비 가성비 분석! 교통, 편의시설, 옵션, 관리비, 가격까지 다방면으로 비교하고 선택하세요.

  ▶ 똑똑하게 방 채울 땐, 다방샵
  다방 사용자들을 위한 필수아이템들을 한눈에! 다방샵에서 합리적인 가격으로 만나보세요.

  ▶ 연락한 부동산 저장!
  마음에 들었던 그 방을 계약하고 싶다면 친절했던 부동산의 리뷰를 쓰고 싶으시다면? 연락한 부동산 메뉴를 활용해주세요.

  ▶ 부동산 리뷰 보기
  직접 상담, 방문한 사용자가 작성한 생생한 부동산 리뷰! 허위 매물, 불친절한 부동산을 상담 전, 방문 전에 확인 할 수 있습니다.
""",
    """
다방앱에 회원가입 후 로그인을 하시면

▶ ‘관심목록'의 내용을 안전하게 저장!
원룸∙투룸∙오피스텔 등 다양한 전∙월세 매물을 살펴보는 과정에서 매물을 조회하고 찜한 내역이 쌓이는 ‘관심목록'의 내용을 PC와 모바일에서 동일하게 확인할 수 있습니다. 또한 앱 업데이트 시에도 그 내용이 그대로 유지됩니다.

▶ 단지 찜하기!
아파트 단지 찜하기는 회원님이 찜하신 매물 조건에 따라 신규 매물 등록 알림을 보내드리기 때문에 로그인 한 회원에게만 제공 가능합니다. 마음에 드는 아파트에 거래가능한 방이 없을지라도 해당 단지를 찜해두시면 신규매물일 등록되었을때 당일 알림을 보내드립니다. 누구보다 빠르게 원하는 방을 찾아보세요!

▶ 직거래로 방 내놓기!
공인중개사가 아닌 개인 회원도 직접 방 사진을 찍어 관련 정보를 기입, 매물을 광고할 수 있습니다.

▶ 분양 알림받기!
내가 원하는 분양정보의 '알림받기'를 설정해 놓으면 모집 공고일부터 청약 접수일까지 분양 일정에 대한 알림을 받을 수 있습니다.
""",
    """
다방 서비스 회원탈퇴를 원하실 경우

▶ 다방앱의 ‘더보기’ 메뉴에서 ‘정보수정’으로 이동 후 화면 하단에 '회원탈퇴'를 탭하시면 탈퇴가 가능합니다.

▶ 다방앱과 PC애서 모두 회원탈퇴가 가능하며, 다방의 개선점에 대한 건의 사항은 hello@dabangapp.com 으로 보내주시면 서비스 개선에 큰 도움이 됩니다.
""",
    """
개인회원의 경우 직거래 매물 1건에 대해 무료 광고가 가능합니다.

▶ 다방앱의 '더보기'메뉴에서 ‘방 내놓기’ 버튼을 탭한 후 매물의 위치 정보, 방 종류, 거래 종류(전세∙월세 등) 등의 매물 기본 정보와 관리비, 옵션 사항 등 추가 정보를 상세히 입력하시면 됩니다.

▶ 매물 광고 시 방 사진 3장은 필수 사항이며, 제목과 상세설명을 정성껏 작성해 주시면 광고 효과가 증대됩니다.
""",
    """
다방은 사용자 분들에게 믿을 수 있는 정보를 제공하는 것을 최우선으로 합니다.

▶ 매물의 정확한 위치를 지도 위에 표시하고, 매물 근처의 편의시설 등을 한 눈에 볼 수 있도록 하여 발품을 팔지 않고도 주변 환경까지 확인하실 수 있도록 했습니다.

▶ 또한 지속적인 허위매물 관리를 통해 사용자 분들이 허위정보로 인한 불편함을 느끼지 않도록 노력하고 있습니다.
""",
    """
허위매물 전담팀이 수시로 매물을 살펴보고 허위매물을 필터링하고 있습니다.

▶ 지역구별 평균 시세를 파악해 시세에 비해 확연히 저렴한 매물이나 실사진이 아닌 사진이 포함된 경우 직접 연락을 취해 정보 수정을 요청합니다.

▶ 광고 기간이 30일이 지난 매물의 경우 자동으로 비공개 처리하여 계약이 완료된 매물의 노출 가능성을 줄였고,

▶ 사용자가 직접 허위매물을 신고할 수 있도록 관련 제도를 마련하여 다방면에서 허위매물 ZERO를 위한 노력을 기울이고 있습니다.
""",
    """
직거래 매물의 경우 1개 계정 당 1개 매물 업로드를 기준으로 합니다. 무분별한 매물 업로드를 통한 허위 정보의 발생을 막기 위해 허위매물 전담팀이 계속해서 직접 매물 정보를 확인하게 됩니다.
""",
    """
다방은 현재 사용자의 편의를 위해 공인중개사에게 전화연결 시 중개사 정보를 휴대폰에 자동 저장해주는 기능을 제공하고 있습니다.

수동 설정(사용/해제)방법은 아래와 같습니다.

▶ 안드로이드폰설정> 애플리케이션 설정> 다방 > 권한 > 주소록 사용안함 설정
*6.0 버전 이하의 안드로이드폰에서는 지원되지 않습니다.

▶ 아이폰 설정 > 다방 > ""연락처""사용안함 설정
"""
  ]


struct Testt: Codable {
    let broker: Int
    let postType, welcomeDescription, loadAddress: String
    let detailAddress: String
    let lng, lat: Double
    let salesFormType, depositChar, monthlyChar: String
    let depositInt, monthlyInt: Int
    let floor, totalFloor, areaChar: String
    let supplyAreaInt: Int
    let supplyAreaChar: String
    let shortRent: Bool
    let managementSet: [String]
    let parkingDetail: String
    let parkingTF: Bool
    let livingExpenses, livingExpensesDetail: String?
    let moveInChar: String
    let moveInDate: String?
    let optionSet: [String]
    let heatingType: String
    let pet, elevator, builtIn, veranda: Bool
    let depositLoan: Bool
    let totalCitizen, totalPark, complete: String
    let securitySafetySet: [String]
    let postimage: [String]
    let complex: Int

    enum CodingKeys: String, CodingKey {
        case broker, postType
        case welcomeDescription = "description"
        case loadAddress, detailAddress, lng, lat, salesFormType, depositChar, monthlyChar, depositInt, monthlyInt, floor, totalFloor, areaChar, supplyAreaInt, supplyAreaChar, shortRent
        case managementSet = "management_set"
        case parkingDetail, parkingTF
        case livingExpenses = "living_expenses"
        case livingExpensesDetail = "living_expenses_detail"
        case moveInChar, moveInDate
        case optionSet = "option_set"
        case heatingType, pet, elevator, builtIn, veranda, depositLoan, totalCitizen, totalPark, complete
        case securitySafetySet = "securitySafety_set"
        case postimage, complex
    }
}

let duckk = Testt(broker: 1, postType: "아파트", welcomeDescription: "한강조망. 집주인 거주로 컨디션 최고. 교통과 생활 편리. 입주 가능- 한강 조망, 단지 내 동형평수 최고라인- 집주인 ", loadAddress: "서울시 성동구 성수동2가 843", detailAddress: "서울시 성동구 성수동2가 843", lng: 37.5412343020006, lat: 127.052138909865, salesFormType: "매매", depositChar: "11억", monthlyChar: "중층", depositInt: 1100000000, monthlyInt: 0, floor: "중층 ", totalFloor: "29층", areaChar: "42.22 / 60.07㎡", supplyAreaInt: 18, supplyAreaChar: "13 / 18평", shortRent: false, managementSet: [], parkingDetail: "", parkingTF: false, livingExpenses: "", livingExpensesDetail: "", moveInChar: "", moveInDate: "", optionSet: [], heatingType: "개별남방", pet: false, elevator: false, builtIn: false, veranda: false, depositLoan: false, totalCitizen: "445세대", totalPark: "1.8대", complete: "2009.06 준공", securitySafetySet: [], postimage: [], complex: 3)
