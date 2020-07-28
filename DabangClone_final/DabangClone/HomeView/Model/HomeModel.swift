//
//  HomeModel.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/16.
//  Copyright © 2020 pandaman. All rights reserved.
//
import Foundation
import UIKit

enum HomeInfo {
  case 관심지역
  case 단지
  case 분양정보
  case 추천콘텐츠
}
enum HomeCellType {
  case 관심지역
  case 단지
  case 분양정보
  case 추천콘텐츠
}

extension HomeInfo {
  func setTitle() -> String {
    var title: String!
    switch self {
    case .관심지역:
      title = "관심지역 모든 방"
    case .단지:
      title = "더방님의 관심있게 본 단지"
    case .분양정보:
      title = "분양정보"
    case .추천콘텐츠:
      title = "더방님의 위한 추천 콘텐츠"
    }
    return title
  }
}
struct HomeData {
  var homeInfo: HomeInfo
  var homeCellType: HomeCellType
}
let datas :[HomeData] = [
  HomeData(homeInfo: .관심지역, homeCellType: .관심지역),
  HomeData(homeInfo: .단지, homeCellType: .단지),
  HomeData(homeInfo: .분양정보, homeCellType: .분양정보),
  HomeData(homeInfo: .추천콘텐츠, homeCellType: .추천콘텐츠),
]

struct ContentData {
  var image: String
  var title: String
  var url: String
  var count: String
}

let contentDatas: [ContentData] = [
  ContentData(image: "contentsImage1", title: "'청년맞춤' 전월세", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "42,353"),
  ContentData(image: "contentsImage2", title: "공적마스크 판매처", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "12,448"),
  ContentData(image: "contentsImage3", title: "다방 광고 찰영 현장", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=27253794&memberNo=2120568", count: "75,151"),
  ContentData(image: "contentsImage4", title: "방 계약가능 여부 미", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "9,754"),
  ContentData(image: "contentsImage5", title: "이사 준비한다면 필독!", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=25389507&memberNo=2120568", count: "25,748"),
  ContentData(image: "contentsImage6", title: "방 구하기 전, 매몰", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=25443036&memberNo=2120568", count: "83,474"),
  ContentData(image: "contentsImage7", title: "다방 허위매몰 예방", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "32,487"),
  ContentData(image: "contentsImage8", title: "나에게 꼭 맞는 방", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "33,100"),
  ContentData(image: "contentsImage9", title: "아파트 청약정보 한", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "44,451"),
  ContentData(image: "contentsImage10", title: "만 19~34세라면?", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "68,284"),
  ContentData(image: "contentsImage11", title: "부동산 용어 정리", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "40,148"),
  ContentData(image: "contentsImage12", title: "분양가상한제가 뭔", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "91,565"),
]


struct SaleHomeData {
  var image: String
  var title: String
  var detail: String
  var type: String
}

let saleHomeDatas: [SaleHomeData] = [
  SaleHomeData(image: "saleHomeImage1", title: "20.07.27 특별공급", detail: "기흥 푸르지오 포레피스", type: "분양중"),
  SaleHomeData(image: "saleHomeImage2", title: "20.07.29 특별공급", detail: "영통 아이파크 케슬", type: "분양중"),
  SaleHomeData(image: "saleHomeImage3", title: "20.07.21 ~ 20.07.22 1순위 선착", detail: "노원 롯데캐슬 시그니쳐", type: "분양중"),
]

struct InterestRoom {
  var image: String
  var title: String
  var detail: String
}

let interestRoomDatas: [InterestRoom] = [
  InterestRoom(image: "interestRoomImage1", title: "성수역", detail: "원룸"),
  InterestRoom(image: "interestRoomImage2", title: "창천동", detail: "원룸, 투룸"),
  InterestRoom(image: "interestRoomImage3", title: "광장동", detail: "원룸"),
  InterestRoom(image: "interestRoomImage4", title: "구의동", detail: "원룸"),
  InterestRoom(image: "interestRoomImage5", title: "신촌역", detail: "투룸"),
]

struct InterestApart {
  var image: String
  var title: String
  var detail: String
}

let interestApartDatas: [InterestApart] = [
  InterestApart(image: "interestApartImage1", title: "금호 2차", detail: "아파트, 141세대 1997.08"),
  InterestApart(image: "interestApartImage2", title: "성수대우1차", detail: "아파트, 108세대 1999.04"),
  InterestApart(image: "interestApartImage3", title: "청정", detail: "아파트, 28세대 2003.12"),
  InterestApart(image: "interestApartImage4", title: "연세힐하우스", detail: "아파트, 18세대 2005.08"),
  InterestApart(image: "interestApartImage5", title: "대명루첸", detail: "아파트, 114세대 2009.02"),
]
