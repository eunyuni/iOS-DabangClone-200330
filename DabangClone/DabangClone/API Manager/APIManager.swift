//
//  APIManager.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KeychainSwift

enum LoginWays {
    case local
    case apple
    case kakao
    case facebook
}

enum Key {
    static let keyChain = "keyChain"
}

final class APIManager {
    
    // MARK: - Properties
    static let shared = APIManager()
    
    private let keyChain = KeychainSwift(keyPrefix: "DabangCloneUser_")
    var userPk = 0
    private let networkAccessManager = NetworkReachabilityManager(host: "https://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com")
    private let baseURL = "dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com"
    
    var loginWay: LoginWays?
    
    private init() { monitorNetworkAccessStatus() }
    
    
    // MARK: - [ Monitoring Celluar Network Access Status ]
    private func monitorNetworkAccessStatus() {
        networkAccessManager?.startListening(onQueue: .init(label: "networkQueue"), onUpdatePerforming: { (status) in
            print("Network Status has been changed: \(status)")
        })
    }
    
    
    // MARK: - [ Manage JWT ]
    func getAccessTokenFromKeyChain() -> String {
        let accessToken = keyChain.get(Key.keyChain) ?? ""
        return accessToken
    }
    
    func setAccessTokenIntoKeyChain(token: String, key: String) -> Bool {
        return keyChain.set(token, forKey: key, withAccess: .accessibleWhenUnlocked)
    }
    
    func checkJWTExpiration() {
        let jwt = getAccessTokenFromKeyChain()
        var payloadString = jwt.components(separatedBy: ".")[1]
        while payloadString.count % 4 != 0 {
            payloadString += "="
        }

        let payloadData = Data(base64Encoded: payloadString, options: .ignoreUnknownCharacters)!

        guard let json = try? JSONSerialization.jsonObject(with: payloadData) as? [String:Any] else { return }
        let exp = json["exp"] as! Int
        let expDate = Date(timeIntervalSince1970: TimeInterval(exp))
        if expDate <= Date() {
            refreshJWT()
        }
    }

    func refreshJWT() {

    }
    
    // MARK: - [ API CRUD ]
    // MARK: - GET
    
    //GET: 유저 정보
    func getUserProfile(completion: @escaping (Result<User, Error>) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        AF.request( baseURL + "/members/\(userPk)/", headers: header)
            .responseDecodable(of: User.self) { (response) in
                switch response.result {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
                
        }
    }
    
    //GET: 방 전체 리스트
    func getEntireRoomData(completion: @escaping (Result<[DabangElement], Error>) -> Void) {
        AF.request( baseURL + "/posts/list/")
          .responseDecodable(of: [DabangElement].self) { (response) in
                switch response.result {
                case .success(let rooms):
                    completion(.success(rooms))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    //GET: pk를 기준으로 특정 방 1개
    func getCertainRoomData(pk: Int, completion: @escaping (Result<DabangElement, Error>) -> Void) {
        AF.request( baseURL + "/posts/\(pk)/" )
            .responseDecodable(of: DabangElement.self) { (response) in
                switch response.result {
                case .success(let room):
                    completion(.success(room))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    //GET: 최근 본 방 리스트
    func getRecentlyCheckedRooms(userPK: Int, completion: @escaping (Result<[DabangElement], Error>) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        AF.request( baseURL + "/members/\(userPK)/", method: .get, headers: header)
          .responseDecodable(of: User.self) { (response) in
                switch response.result {
                case .success(let user):
                    completion(.success(user.recentlyCheckedRooms ?? []))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    
    //GET: 찜한 방 리스트
    func getMarkedRooms(completion: @escaping (Result<[DabangElement], Error>) -> Void) {
        
    }
    
    //GET: 전체 단지 정보 리스트
    func getComplexInfoList(completion: @escaping (Result<[Complex], Error>) -> Void) {
        AF.request( baseURL + "/posts/complex/", method: .get)
            .responseDecodable(of: [Complex].self) { (response) in
                switch response.result {
                case .success(let complex):
                    completion(.success(complex))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
  
  func getItemsInCurrentMap(km: Double, current position: CLLocationCoordinate2D, completion: @escaping (Result<[BangInCurrentMapModel], Error>) -> Void) {
    
    var parameter: Parameters = [
      "reqLng": position.longitude,
      "reqLat": position.latitude,
      "distance": km
    ]
    
    AF.request(baseURL + "/posts/distance/", method: .get, parameters: parameter)
      .responseDecodable(of: [BangInCurrentMapModel].self) { (response) in
        switch response.result {
        case .success(let data):
          completion(.success(data))
        case .failure(let error):
          completion(.failure(error))
        }
        
    }
    
  }
    
    
  
  //GET: 전체 분양 정보 리스트
  func getSaleInfoList(completion: @escaping (Result<SaleAll, Error>) -> Void) {
    AF.request( baseURL + "/presales/", method: .get)
      .responseDecodable(of: SaleAll.self) { (response) in
        switch response.result {
        case .success(let complex):
          completion(.success(complex))
        case .failure(let error):
          completion(.failure(error))
        }
    }
  }
  
  //GET: id를 기준으로 특정 분양 1개
  func getCertainSaleData(id: Int, completion: @escaping (Result<SaleInfo, Error>) -> Void) {
    AF.request( baseURL + "/presales/" + "\(id)" + "/", method: .get).responseDecodable(of: SaleInfo.self) { (response) in
      switch response.result {
      case .success(let sale):
        completion(.success(sale))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  //GET: theme를 기준으로 특정 분양정보 1개
  func getCertainThemeData(pk: Int, completion: @escaping (Result<DabangElement, Error>) -> Void) {
      let parameter = ["pk" : pk]
      AF.request( baseURL + "/posts/list/", parameters: parameter)
          .responseDecodable(of: DabangElement.self) { (response) in
              switch response.result {
              case .success(let room):
                  completion(.success(room))
              case .failure(let error):
                  completion(.failure(error))
              }
      }
  }
    // MARK: - POST
  
  
    
    //POST: 유저 생성
    func postCreteUser(username: String, password: String, email: String, profileImage: UIImage? = nil, completion: @escaping (String,Bool) -> Void) {
//        let imageData = profileImage?.jpegData(compressionQuality: 0.7) ?? Data()
        let userData: [String: Any] = ["username" : username, "password" : password, "email": email]
//        let nameData = Data(username.utf8)
//        let passwordData = Data(password.utf8)
//        let emailData = Data(email.utf8)
//
//        AF.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(nameData, withName: "username")
//            multipartFormData.append(imageData, withName: "profileImage")
//            multipartFormData.append(emailData, withName: "email")
//            multipartFormData.append(passwordData, withName: "password")
//        }, to: baseURL + "/members/")
        
        AF.request( baseURL + "/members/", method: .post, parameters: userData)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let pk = json["pk"]
                    let email = json["email"]
//                    let succecc = "아이디가 성공적으로 생성되었습니다."
                    completion("pkNumber: \(pk)\n email: \(email)", true)
                case .failure(_):
                    let fail = "해당 사용자 이름은 이미 존재합니다."
                    completion(fail, false)
                }
        }
    }
    
    //POST: 자체 로그인
    func postUserLogin(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let loginInfo = ["email" : email, "password" : password]
        AF.request( baseURL + "/members/jwt/", method: .post, parameters: loginInfo)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let accessToken = json["token"].stringValue
                    self.userPk = json["user"]["pk"].intValue
                    let result = self.setAccessTokenIntoKeyChain(token: accessToken, key: Key.keyChain)
                
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
  
    
    //POST: 방 내놓기
    func postRoomForSale(room: DabangElement, completion: @escaping (Result<DabangElement, Error>) -> Void) {
        AF.request( baseURL + "/posts/", method: .post, parameters: room, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: DabangElement.self) { (response) in
                switch response.result {
                case .success(let room):
                    completion(.success(room))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
  
//  func postMyRoomForSale(room: DabangTinyElement, completion: @escaping ([String:Any]) -> Void) {
//
//    let encoder = JSONEncoder()
//    let jsonData = try! encoder.encode(room)
//
//    let url = baseURL
//
//    AF.request(url, method: .post, parameters: jsonData, encoder: JSONParameterEncoder.default, headers: .none, interceptor: .none, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
//
//      let parameters = ["type":"투룸", "description":"원룸"]
//      AF.upload(multipartFormData: { (multipartFormData) in
//        for (key, value) in parameters {
//          multipartFormData.append(value.data(using: .utf8)!, withName: key)
//        }
//      }, to: baseURL + "/posts/create").responseJSON { response in
//        guard let json = try? JSONSerialization.jsonObject(with: response.data ?? Data()) as? [String : Any] else { return }
//  //      guard let message = json["image"] as? String else { return }
//        completion(json)
//      }
//    }
  
  
  func put(completionHandler: @escaping ([String:Any]) -> Void) {
    let userData = DabangTinyElement(pk: 50, type: .원룸, dabangTinyDescription: "테스트", address: Addresss(pk: 20, loadAddress: "", detailAddress: ""), lng: 0.00, lat: 0.00, salesForm: .none, pet: .none, elevator: false, veranda: false, depositLoan: false, postimage: [], complex: .none)
    let parameter = ["elevator" : "true", "veranda" : "false" ]
    
    let testImgData = UIImage(named: "SaleMainImage")!.jpegData(compressionQuality: 0.1)!
let testImgData2 = UIImage(named: "AreaImage")!.jpegData(compressionQuality: 0.1)!
    
    AF.upload(multipartFormData: { (MultipartFormData) in
      MultipartFormData.append(testImgData, withName: "image", fileName: "\(Array(1111...2222).randomElement()).jpeg", mimeType: "image/jpeg")
      MultipartFormData.append(testImgData2, withName: "image", fileName: "\(Array(1111...2222).randomElement()).jpeg", mimeType: "image/jpeg")

//      for (key, value) in parameter {
//      MultipartFormData.append((UIImage(named: "SaleMainImage")?.jpegData(compressionQuality: 0.1))!, withName: "image")
//      MultipartFormData.append((UIImage(named: "SaleMainImage")?.jpegData(compressionQuality: 0.1))!, withName: "image")
//      MultipartFormData.append((UIImage(named: "SaleMainImage")?.jpegData(compressionQuality: 0.1))!, withName: "image")
//      }
    }, to: baseURL + "/posts/create/", method: .post).responseJSON { (response) in
      switch response.result {
      case .success(let data):
        print("방생성 성공")
        completionHandler(data as! [String : Any])
      case .failure(let error):
        print("방생성 실패")
        
      }
      
    }
//    AF.request(baseURL + "/posts/create/", method: .put, parameters: userData, encoder: JSONParameterEncoder.default, headers: .none, interceptor: .none).responseJSON { (response) in
//      switch response.result {
//      case .success(let userData):
//        print("방생성 성공")
//      case .failure(let error):
//        print("방생성 실패")
//        print(response.error)
//        completionHandler(.failure(error))
//      }
//    }
  }

  
    
    //POST: 최근 본 방
    func postRecentlyCheckedRoom(roomPk: Int, completion: @escaping (String) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        let parameter = ["post" : roomPk]
        AF.request( baseURL + "/members/recently/", method: .post, parameters: parameter, headers: header )
            .responseData { (response) in
                guard let json = try? JSONSerialization.jsonObject(with: response.data ?? Data()) as? [String : Any] else { return }
                guard let message = json["message"] as? String else { return }
                completion(message)
            }
    }
    
    
    //POST: 최근 본 단지
    func postRecentlyCheckedComplex(complexPk: Int, completion: @escaping (String) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        let parameter = ["post" : complexPk]
        AF.request( baseURL + "/members/recentlyComplex/", method: .post, parameters: parameter, headers: header )
            .responseData { (response) in
                guard let json = try? JSONSerialization.jsonObject(with: response.data ?? Data()) as? [String : Any] else { return }
                guard let message = json["message"] as? String else { return }
                completion(message)
            }
    }
    
  //POST: 찜한 방
  func postPoto(image: UIImage, imageName : String, completion: @escaping (String) -> Void) {
    let imageData = image.jpegData(compressionQuality: 0.50)
    print(image, imageData!)
    let test = baseURL + "/posts/imageupload/"
    AF.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(imageData!, withName: "image", fileName: imageName + ".png", mimeType: "image/png")
    }, to: test).responseJSON { response in
      guard let json = try? JSONSerialization.jsonObject(with: response.data ?? Data()) as? [String : Any] else { return }
      guard let message = json["image"] as? String else { return }
      completion(message)
    }
  }
    
    //POST: 방 찜하기
    func postMarkRoom(roomPK: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let endPoint = baseURL + "/posts/postLike/?post=\(roomPK)"
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        AF.request(endPoint, method: .post, headers: header)
            .response { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    
    //POST: 연락한 부동산 추가
    func postContactedBroker(brokerPK: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        let parameter = ["broker": "\(brokerPK)"]
        AF.request(baseURL + "/members/contactTo/", method: .post, parameters: parameter, headers: header)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let message = json["message"].stringValue
                    completion(.success(message))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    //POST: 이미지 업로드
    func postPhoto(image: UIImage, imageName : String, completion: @escaping (String) -> Void) {
        let imageData = image.jpegData(compressionQuality: 0.50)
        print(image, imageData!)
        let test = baseURL + "/posts/imageupload/"
        AF.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData!, withName: "image", fileName: imageName + ".png", mimeType: "image/png")
        }, to: test).responseJSON { response in
            guard let json = try? JSONSerialization.jsonObject(with: response.data ?? Data()) as? [String : Any] else { return }
            guard let message = json["image"] as? String else { return }
            completion(message)
        }
    }
    
    
    // MARK: - PATCH
    
    //PATCH: 유저 정보 수정
    func patchUpdateUserInfo(phone: String, image: String, completion: @escaping (Result<User, Error>) -> Void) {
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        let parameters = ["phone" : phone, "profileImage" : image]
        AF.request( baseURL + "/members/\(userPk)/", method: .patch, parameters: parameters, headers: header )
            .responseDecodable(of: User.self) { (response) in
                switch response.result {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
        }
    }
    
    
    // MARK: - DELETE
  func logout() -> Bool {
    return keyChain.clear()
  }
    
    //DELETE: 찜한 방 삭제
    func deleteMarkedRoom(roomPK: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let endPoint = baseURL + "/posts/postLike/?post=\(roomPK)"
        let header: HTTPHeaders = [.authorization(bearerToken: getAccessTokenFromKeyChain())]
        AF.request(endPoint, method: .delete, headers: header)
            .response { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    
}
