//
//  MoreViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/23.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Alamofire

enum MoreViewButtons {
  case 알림
  case 방내놓기
  case 내가쓴리뷰
  case 연락한부동산
  case 매물번호조회
  case 자주묻는질문
  case 이벤트
  case 공지사항
  case 일대일문의
  case 이용약관
  case 개인정보처리방침
  case 다방프로
  case 페이스북
  case 네이버포스트
}

class MoreViewController: UIViewController {
  
  //MARK: - 프로퍼티
  let userName = "PandaMan"
  let userEmail = "user@user.com"
  var roomForSaleData = RoomForSale.shared.roomData
  
  let testTextField = UITextField().then {
    $0.backgroundColor = .gray
  }
  
  //MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let moreView = MoreView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
    moreView.delegate = self
    self.view.backgroundColor = .white
    //      navigationController?.pushViewController(LoginViewController(), animated: true)
    
    self.setupUI(vc: moreView)
//    self.getTest()
    
    //      DispatchQueue.global(qos: .background).async {
    //        print("async start")
    //        self.getTest()
    //        print("async end")
    //      }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
    self.tabBarController?.tabBar.isHidden = false
  }
  
  //MARK: - SetupUI & Constraints
  private func setupUI(vc: UIView) {
    
    view.addSubview(vc)
    setupConstraints()
  }
  
  private func setupConstraints() {
    
  }
  
  func presentView(_ sender: MoreViewButtons) {
    
    switch sender {
    case .알림:
      let vc = NoticeViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .방내놓기:
      print("잘왔음")
      let vc = RoomGuideViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .이벤트:
      print("이벤트")
      let vc = EventViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .공지사항:
      print("공지사항")
      let vc = NoticeViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .일대일문의:
      print("1:1문의")
      let vc = InquiryViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .이용약관:
      print("이용약관")
      let vc = TermsAndConditionsViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    case .개인정보처리방침:
      print("개인정보처리방침")
      let vc = PrivacyPolicyViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
      
      
      
      //    case .내가쓴리뷰:
      //      print("내가쓴리뷰버튼")
      //      let vc = NoticeViewController()
      //      vc.modalPresentationStyle = .fullScreen
    //      self.navigationController?.pushViewController(vc, animated: true)
    case .자주묻는질문:
      print("Go to 자주묻는질문")
      let vc = FrequentlyViewController()
      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    default:      break
    }
    
  }
  
  private func getTest() {
    let param: Parameters =
      ["" : "4/"]
    let pk = 4
    
    let url = URL(string: "http://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com/posts/")
    
    
    AF
      .request(url!, method: .get, parameters: .none, encoding: URLEncoding.default, headers: .none, interceptor: .none)
      .responseData(queue: .global(), completionHandler: { (response) in
        print(response.data as Any)
        
        if let jsonObjects = try? JSONDecoder().decode([DabangElement].self, from: response.data!) {
          
          print(jsonObjects[0].address)
          
        } else {
          print("fail")
        }
      })
  }
}


extension MoreViewController: MoreViewDelegate {
  func didTapSellMyRoomButton(_ sender: MoreViewButtons) {
    presentView(sender)
  }
}
