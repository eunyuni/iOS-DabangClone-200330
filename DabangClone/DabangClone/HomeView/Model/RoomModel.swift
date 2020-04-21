//
//  RoomModel.swift
//  DabangClone
//
//  Created by 정의석 on 2020/04/05.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


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

extension Options {
  func imageName() -> String {
    var imageName = ""
    switch self {
    case .에어컨:
      imageName = "https://www.dabangapp.com/static/media/aircondition.44b18cc8.svg"
    case .세탁기:
      imageName = "https://www.dabangapp.com/static/media/laundry.0a16ead7.svg"
    case .책상:
      imageName = "https://www.dabangapp.com/static/media/desk.748a98e2.svg"
    case .신발장:
      imageName = "https://www.dabangapp.com/static/media/shoes.bb4d329a.svg"
    case .인덕션:
      imageName = "https://www.dabangapp.com/static/media/induction.5e864e8c.svg"
    case .전자도어락:
      imageName = "https://www.dabangapp.com/static/media/doorlock.7232c733.svg"
    case .냉장고:
      imageName = "https://www.dabangapp.com/static/media/refrigerator.e02bcaa9.svg"
    case .전자레인지:
      imageName = "https://www.dabangapp.com/static/media/microoven.8ea02a25.svg"
    case .가스레인지:
      imageName = "https://www.dabangapp.com/static/media/gas.fbf3fa6e.svg"
    case .침대:
      imageName = "https://www.dabangapp.com/static/media/bed.df0ca1a5.svg"
    case .TV:
      imageName = "https://www.dabangapp.com/static/media/tv.476aa44b.svg"
    case .옷장:
      imageName = "https://www.dabangapp.com/static/media/closet.c5f64c5d.svg"
    case .비데:
      imageName = "https://www.dabangapp.com/static/media/bidet.3bc9f2e6.svg"
    default:
      break
    }
    return imageName
  }
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
  
  func imageStringToImage() -> UIImage {
    let url = URL(string: image)!
    var image = UIImage()
    if let data = try? Data(contentsOf: url) {
        image = UIImage(data: data)!
    }
    return image
  }
}


let dummyBaseInfo = BaseInfoOfRoom(sellStyle: .월세, roomStyle: .원룸, cost: "500/30", detailText: "햇빛이 잘 드는 남향집" , adminCost: false, parking: true, shortRental: false, monthCost: "50만원", floorOfthisRoom: "6층", floorOfthisBuilding: 9,
                                   dedicatedArea: 18.34, supplyArea: 23.43, ableDaysToMoveIn: "즉시 입주")
let dummyAddInfo = AdditionalInfoOfRoom(builtIn: true, elevator: true, heatingType: "중앙난방", pet: false, balcony: false, charterLoan: true, option: [.냉장고, .가스레인지, .옷장, .신발장, .에어컨, .전자도어락])

let dummyBrokerageOffice = BrokerageOffice(officeName: "이수공인중개사무소", officeLocation: "사당동 307-11", reviews: "친절해요", brokerName: "김판다", roosOfThisOffice: [])

let dummyRoomImages = [RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/8506fbcf-ce44-4b5c-b254-cb35ef95017f"),
                       RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/30b20f7c-6ffe-4b22-a41d-9819749b6a49"),
                       RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/5b364cf1-bad1-4524-b7c8-d0ebcdf699e3"),
                       RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/a09271e3-c794-431c-ba2d-fcc002e69d7a"),
                       RoomImage(image: "https://d1774jszgerdmk.cloudfront.net/1024/3fd9b980-b76c-4d2e-9c7d-99e21d8cdfa1")]

let dummyRoom = Room(roomID: 1, images: dummyRoomImages, location: "동작구 사당동 307-11", baseInfo: dummyBaseInfo, addInfo: dummyAddInfo, roomScore: 83.5, detailExplain: "사당역에서 걸어서 10분거리에 위치한 복층 1.5룸입니다/n많이 연락 주세요", brokerageOffice: dummyBrokerageOffice)
let dummyRoom2 = Room(roomID: 2, images: dummyRoomImages, location: "동작구 사당동 307-11", baseInfo: dummyBaseInfo, addInfo: dummyAddInfo, roomScore: 83.5, detailExplain: "해가 잘 들어옵니다.사당역에서 걸어서 10분거리에 위치한 복층 1.5룸입니다.", brokerageOffice: dummyBrokerageOffice)
var rooms = [dummyRoom]

func findRoomDataFromRoomID(_ roomArr: [Room], roomID: Int) -> Room {
  let room = roomArr.filter {
    $0.roomID == roomID
  }
  return room[0]
} //방번호로 방 찾기

struct ExpandableRoom {
  let style: RoomStyle
  var isOpen: Bool = false
}

extension ExpandableRoom {
  func makeTitleText() -> String {
    switch self.style {
    case .원룸:
      return "원룸(주택/빌라)"
      case .투룸:
      return "투룸(주택/빌라)"
      case .쓰리룸:
      return "쓰리룸(주택/빌라)"
      case .오피스텔:
      return "오피스텔"
      case .아파트:
      return "아파트"
    default:
      break
    }
  }
}

enum RoomType {
  case 단독주택, 다가구주택, 빌라연립다세대, 상가주택, 오피스텔, 도시형생활주택, 아파트
}

