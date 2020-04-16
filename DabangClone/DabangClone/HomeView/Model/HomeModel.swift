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
      title = "덕덕님의 관심있게 본 단지"
    case .분양정보:
      title = "분양정보"
    case .추천콘텐츠:
      title = "덕덕님의 위한 추천 콘텐츠"
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

//enum BaseInfo {
//  case 빈케이스
//  case 가격
//  case 층수
//  case 방크기
//  case 단기임대
//  case 관리비
//  case 주차
//  case 입주가능일
//}
//enum AdditionalInfo {
//  case 빈케이스
//  case 옵션
//  case 난방종류
//  case 반려동물
//  case 엘리베이터
//  case 복층
//  case 일쩜오룸
//  case 빌트인
//  case 베란다
//  case 전세자금대출
//  case 준공년도
//}
//enum CellType {
//  case Title
//  case Input
//  case AbleSegment
//  case IsThere
//  case ThreeSegment
//  case CheckBox
//}
//extension BaseInfo {
//  func setTitle() -> String {
//    var title: String!
//    switch self {
//    case BaseInfo.빈케이스:
//      title = ""
//    case BaseInfo.가격:
//      title = "가격"
//    case BaseInfo.층수:
//      title = "층수"
//    case BaseInfo.방크기:
//      title = "방 크기"
//    case BaseInfo.단기임대:
//      title = "단기임대"
//    case BaseInfo.관리비:
//      title = "관리비"
//    case BaseInfo.주차:
//      title = "주차"
//    case BaseInfo.입주가능일:
//      title = "입주가능일"
//    }
//    return title
//  }
//}
//extension AdditionalInfo {
//  func setTitle() -> String {
//    var title: String!
//    switch self {
//    case AdditionalInfo.빈케이스:
//      title = ""
//    case AdditionalInfo.옵션:
//      title = "옵션"
//    case AdditionalInfo.난방종류:
//      title = "난방종류"
//    case AdditionalInfo.반려동물:
//      title = "반려동물"
//    case AdditionalInfo.엘리베이터:
//      title = "엘리베이터"
//    case AdditionalInfo.복층:
//      title = "복층"
//    case AdditionalInfo.일쩜오룸:
//      title = "1.5룸, 주방분리형"
//    case AdditionalInfo.빌트인:
//      title = "빌트인"
//    case AdditionalInfo.베란다:
//      title = "베란다/발코니"
//    case AdditionalInfo.전세자금대출:
//      title = "전세자금대출"
//    case AdditionalInfo.준공년도:
//        title = "준공년도"
//    }
//    return title
//  }
//}
