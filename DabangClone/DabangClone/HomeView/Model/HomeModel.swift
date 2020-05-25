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
      title = "문경호님의 관심있게 본 단지"
    case .분양정보:
      title = "분양정보"
    case .추천콘텐츠:
      title = "문경호님의 위한 추천 콘텐츠"
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

struct contentData {
  var image: String
  var title: String
  var url: String
  var count: String
}

let contentDatas: [contentData] = [
  contentData(image: "contentsImage1", title: "'청년맞춤' 전월세", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "42,353"),
  contentData(image: "contentsImage2", title: "공적마스크 판매처", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "12,448"),
  contentData(image: "contentsImage3", title: "다방 광고 찰영 현장", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=27253794&memberNo=2120568", count: "75,151"),
  contentData(image: "contentsImage4", title: "방 계약가능 여부 미", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "9,754"),
  contentData(image: "contentsImage5", title: "이사 준비한다면 필독!", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=25389507&memberNo=2120568", count: "25,748"),
  contentData(image: "contentsImage6", title: "방 구하기 전, 매몰", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=25443036&memberNo=2120568", count: "83,474"),
  contentData(image: "contentsImage7", title: "다방 허위매몰 예방", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "32,487"),
  contentData(image: "contentImage8", title: "나에게 꼭 맞는 방", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "33,100"),
  contentData(image: "contentImage9", title: "아파트 청약정보 한", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=20499127&memberNo=2120568", count: "44,451"),
  contentData(image: "contentImage10", title: "만 19~34세라면?", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "68,284"),
  contentData(image: "contentImage11", title: "부동산 용어 정리", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "40,148"),
  contentData(image: "contentImage12", title: "분양가상한제가 뭔", url: "https://post.naver.com/viewer/postView.nhn?volumeNo=26344001&memberNo=2120568", count: "91,565"),
]
