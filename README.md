# Dabang Clone

패스트 캠퍼스 iOS School에서 진행했던 Backend School과의 협업 프로젝트 입니다.



## Description

- 기간 : 2020.03.20 ~ 2020.04.29
- 사용 기술
  - Language : Swift
  - Framework : UIKit, CoreLocation, RxSwift
  - Library : FBSDKCoreKit, FBSDKLoginKit, FBSDKShareKit, SnapKit, RxCocoa, RxViewController, Alamofire, Then, Kingfisher, SwiftSVG, SDWebImage, MultiSlider, SwiftyJSON, KeychainSwift, DKImagePickerController, Gedatsu, GoogleMaps
- 팀원 : 5명( iOS 4명 + Backend 1명)



## 담당 기능 구현

| 분양정보목록                                                 | 분양디테일화면                                               | 지역별보기                                                   | 1:1 문의                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![](https://user-images.githubusercontent.com/57210827/88653796-7d934080-d107-11ea-84b7-600d80f561fb.gif) | ![](https://user-images.githubusercontent.com/57210827/88653762-74a26f00-d107-11ea-988d-1ad2297f3d2b.gif) | ![지역별보기.mov](https://tva1.sinaimg.cn/large/007S8ZIlgy1gh6t5x8i6ng306o0dwhdv.gif) | ![1대1문의.mov](https://tva1.sinaimg.cn/large/007S8ZIlgy1gh6t618xu7g306o0dwat1.gif) |



## 성과

- Alamofire, Kingfisher, SnapKit, Then등의 라이브러리를 적용하여 생산성 향상
- UI 오토레이아웃 이해도 향상
- TableView와 CollectionView의 재사용 셀 활용도 향상
- 필요한 데이터 구조를 파악하여 백엔드팀과 원활한 커뮤니케이션 
- itrm, GitKraken으로 안정적으로 프로젝트 관리



## Design

- Flow chart : 초기 기획 단계에서 앱의 흐름과 주요 기능을 파악, UI 분석

![DabangFlowChart](https://tva1.sinaimg.cn/large/007S8ZIlgy1gh6ur90omzj327a0u010x.jpg)



## Implementation

##### Feature

| 소셜 로그인 기능 구현 (Kakao, Apple, Facebook)               | 메인화면                                                     | 분양 정보관 구현                                             | 구글 맵 + 클러스터링,<br /> 위치 기반 매물 연동              |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzugw3665j30u01k9h81.jpg" alt="스크린샷 2020-07-22 오후 5.34.18" style="zoom:33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzug3slv7j30u01k9qv5.jpg" alt="스크린샷 2020-07-22 오후 5.34.46" style="zoom:33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzue0buygj30u01k9u0x.jpg" alt="스크린샷 2020-07-22 오후 5.37.02" style="zoom: 33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuerp851j30u01k9hdt.jpg" alt="스크린샷 2020-07-22 오후 5.36.42" style="zoom:33%;" /> |
| 매물 비교하기 기능                                           | 분양 단지 정보                                               | 분양 단지 목록                                               | 관심 목록 기능                                               |
| <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuhe65ekj30u01k94qp.jpg" alt="스크린샷 2020-07-22 오후 5.36.08" style="zoom:33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuhxaiozj30u01k9kjl.jpg" alt="스크린샷 2020-07-22 오후 5.37.54" style="zoom:33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuj8ekjvj30u01k9kjl.jpg" alt="스크린샷 2020-07-22 오후 5.37.34" style="zoom:33%;" /> | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuicluxej30u01k9e81.jpg" alt="스크린샷 2020-07-22 오후 5.36.00" style="zoom:33%;" /> |
| 프로필 관리                                                  | 주소검색                                                     | 방 내놓기 기능                                               | 방내놓기 완료                                                |
| <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuirhiguj30u01k9kff.jpg" alt="스크린샷 2020-07-22 오후 5.38.00" style="zoom:33%;" /> | ![스크린샷 2020-07-22 오후 6.04.55](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzv95bs17j30u01k91kx.jpg) | <img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuleuik4j30u01k9h8w.jpg" alt="스크린샷 2020-07-22 오후 5.38.14" style="zoom:25%;" /> | ![스크린샷 2020-07-22 오후 6.05.14](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzv8y55j4j30u01k9b29.jpg) |



- 소셜 로그인 기능 구현 (Kakao, Apple, Facebook)

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzt8hhpwzg30dw07te08.gif" alt="login.mov" style="zoom:150%;" />



## 협업

- Github : 최상위 Organization을 기반으로 각자 작업한 뒤 Solve Conflic -> 풀 리퀘스트 -> 병합 프로세스로 진행

![GitKraken.mov](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggzuamg4n7g30dw0a41kz.gif)

* erd

  ![Dabang_erd](https://tva1.sinaimg.cn/large/007S8ZIlgy1gh6rgry8b9j31n40u0430.jpg)



## 영상

![Dabang](https://tva1.sinaimg.cn/large/007S8ZIlgy1gh6rlm3t6jj31hj0u075o.jpg)

* https://www.youtube.com/watch?v=demB9_7O5U4&feature=youtu.be