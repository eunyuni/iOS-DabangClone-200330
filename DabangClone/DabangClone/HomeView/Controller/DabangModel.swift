//
//  Model.swift
//  DabangClone
//
//  Created by 은영김 on 2020/04/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

struct Room {
  let roomID: Int
  let images: [RoomImage] //방 사진들
  let location: String // 방 위치
  let baseInfo: BaseInfoOfRoom
  let addInfo: AdditionalInfoOfRoom
  let roomScore: Float // 다방면 스코어
  let detailExplain: String //상세설명
  let brokerageOffice: BrokerageOffice //중개사무소 정보
}
struct BaseInfoOfRoom {
  let sellStyle: SellStyle // 월세/전세/매매 여부
  let roomStyle: RoomStyle // 원룸/투룸/쓰리룸/오피스텔/아파트
  let cost: String //가격
  let detailText: String //서브타이틀
  let adminCost: Bool //관리비 유무
  let parking: Bool //주차 가능/불가능
  let shortRental: Bool //단기임대 가능여부
  let monthCost: String //한달 총 생활비
  let floorOfthisRoom: String // 층수. 지하때문에 스트링
  let floorOfthisBuilding: Int //해당 건물의 총 층수
  let dedicatedArea: Double //전용면적
  let supplyArea: Double //공급면적
  let ableDaysToMoveIn: String //입주 가능일
}
struct AdditionalInfoOfRoom {
  let builtIn: Bool //빌트인 유무.
  let elevator: Bool //엘리베이터 유무
  let heatingType: String //난방 종류
  let pet: Bool //반려동물 가능 여부
  let balcony: Bool //발코니/베란다 유무
  let charterLoan: Bool //전세 대출 가능 여부
  let option: [Options] //옵션 목록
}
enum Options: String {
  case 에어컨 = "에어컨"
  case 세탁기 = "세탁기"
  case 침대 = "침대"
  case 책상 = "책상"
  case 옷장 = "옷장"
  case TV = "TV"
  case 신발장 = "신발장"
  case 냉장고 = "냉장고"
  case 가스레인지 = "가스레인지"
  case 인덕션 = "인덕션"
  case 전자레인지 = "전자레인지"
  case 전자도어락 = "전자도어락"
  case 비데 = "비데"
}
enum SellStyle: String {
  case 월세 = "월세"
  case 전세 = "전세"
  case 매매 = "매매"
}
enum RoomStyle: String {
  case 원룸 = "원룸"
  case 투룸 = "투룸"
  case 쓰리룸 = "쓰리룸"
  case 오피스텔 = "오피스텔"
  case 아파트 = "아파트"
}
struct BrokerageOffice { //공인중개사 사무소
  let officeName: String
  let officeLocation: String
  let reviews: String
  let brokerName: String
  let roosOfThisOffice: [Room]?
}
struct RoomImage {
  let image: String
}
extension RoomImage {
  func imageToURL() -> URL {
    return URL(string: image)!
  }
}
let dummyBaseInfo = BaseInfoOfRoom(sellStyle: .월세, roomStyle: .원룸, cost: "500/30", detailText: "햇빛이 잘 드는 남향집" , adminCost: false, parking: true, shortRental: false, monthCost: "50만원", floorOfthisRoom: "6층", floorOfthisBuilding: 9,
                                   dedicatedArea: 18.34, supplyArea: 23.43, ableDaysToMoveIn: "05/30")
let dummyAddInfo = AdditionalInfoOfRoom(builtIn: true, elevator: true, heatingType: "중앙난방", pet: false, balcony: false, charterLoan: true, option: [.냉장고, .가스레인지, .신발장, .에어컨, .전자도어락])
let dummyBrokerageOffice = BrokerageOffice(officeName: "이수공인중개사무소", officeLocation: "사당동 307-11", reviews: "친절해요", brokerName: "김판다", roosOfThisOffice: [])
let dummyRoomImages = [RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/8506fbcf-ce44-4b5c-b254-cb35ef95017f"),
                      RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/30b20f7c-6ffe-4b22-a41d-9819749b6a49"),
                      RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/5b364cf1-bad1-4524-b7c8-d0ebcdf699e3"),
                      RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/a09271e3-c794-431c-ba2d-fcc002e69d7a"),
                      RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/3fd9b980-b76c-4d2e-9c7d-99e21d8cdfa1")]
let dummyRoom = Room(roomID: 1, images: dummyRoomImages, location: "동작구 사당동 307-11", baseInfo: dummyBaseInfo, addInfo: dummyAddInfo, roomScore: 83.5, detailExplain: "해가 잘 들어옵니다./n사당역에서 걸어서 10분거리에 위치한 복층 1.5룸입니다/n많이 연락 주세요", brokerageOffice: dummyBrokerageOffice)

var rooms = [dummyRoom]

func findRoomDataFromRoomID(_ roomArr: [Room], roomID: Int) -> Room {
  let room = roomArr.filter {
    $0.roomID == roomID
  }
  return room[0]
} //방번호로 방 찾기
