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



struct NewsTheme {
  var typeLabel: String
  var titleLabel: String
  var DetailLabel: String
  var Image: UIImage?
}

let newsTheme : [NewsTheme] = [
  NewsTheme(typeLabel: "정책", titleLabel: "분양권 전매금지 강화...천안∙춘천까지 '신축 수요'몰리나", DetailLabel: "서울경제 | 2020.05.12", Image: UIImage(named: "newsDetailImage1")),
NewsTheme(typeLabel: "정책", titleLabel: "8월부터 수도권∙광역시 분양권 전매금지...또 풍선효과?", DetailLabel: "서울경제 | 2020.05.11", Image: UIImage(named: "newsDetailImage2")),
NewsTheme(typeLabel: "정책", titleLabel: "비규제 수도권∙지방광역시도 분양권 전매제한 강화...6개월→소유권 이전 등기시", DetailLabel: "서울경제 | 2020.05.11", Image: UIImage(named: "newsDetailImage")),
NewsTheme(typeLabel: "정책", titleLabel: "LH, 올해 첫 행복주택 입주자 모집...전국 2,670가구 대상", DetailLabel: "서울경제 | 2020.05.7", Image: UIImage(named: "newsDetailImage3")),
NewsTheme(typeLabel: "정책", titleLabel: "'시세의30~70%' 청년∙신혼부부 매입임대주택, 18일부터 입주자 모집", DetailLabel: "서울경제 | 2020.05.6", Image: UIImage(named: "newsDetailImage4")),
]


