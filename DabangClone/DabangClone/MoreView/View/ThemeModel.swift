//
//  File.swift
//  URLTest
//
//  Created by 황정덕 on 2020/04/10.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation

struct Theme {
  var imageName: String
  var title: String
  var first: String
  var second: String
  var third: String
}

let themes: [Theme] = [
  Theme(imageName: "themePinkImage", title: """
1,2인 가구를 위한
분양단지 모음
""", first: "서울경기인천", second: "소형평수", third: ""),
  Theme(imageName: "themeGreenImage", title: """
편하게 출퇴근하자!
여세권분양
""", first: "경기인천", second: "서울", third: "도보가능"),
  Theme(imageName: "themeBlueImage", title: """
서울과 가까운
신도시 아파트 분양
""", first: "위례운정", second: "고덕동탄", third: "별내검단"),
  Theme(imageName: "themePinkImage", title: """
서울경기 재개발/재건축
분양 모음
""", first: "서울경기", second: "핫한", third: "조합원"),
  Theme(imageName: "themeGreenImage", title: """
주거환경 인프라를 갖춘
대단지 모음
""", first: "저렴관리비", second: "인프라", third: "천세대이상"),
  Theme(imageName: "themeBlueImage", title: """
집 앞에서 의식주 해결!
몰(mall)세권 분양
""", first: "대형마트", second: "아울렛", third: "백화점"),
  Theme(imageName: "themePinkImage", title: """
힘든 출퇴근은 이제 그만!
GTX권 단지 모음
""", first: "약20분", second: "경기수도", third: "ABC노선"),
]

