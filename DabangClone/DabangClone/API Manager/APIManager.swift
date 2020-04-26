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

final class APIManager {
    
    // MARK: - Properties
    static let shared = APIManager()
    
    private let keyChain = KeychainSwift(keyPrefix: "DabangCloneUser_")
    private var userPk = 0
    private let networkAccessManager = NetworkReachabilityManager(host: "https://moonpeter.com")
    private let baseURL = "https://moonpeter.com"
    
    private init() { monitorNetworkAccessStatus() }
    
    
    // MARK: - [ Monitoring Celluar Network Access Status ]
    private func monitorNetworkAccessStatus() {
        networkAccessManager?.startListening(onQueue: .init(label: "networkQueue"), onUpdatePerforming: { (status) in
            print("Network Status has been changed: \(status)")
        })
    }
    
    
    // MARK: - [ Manage JWT ]
    func getAccessTokenFromKeyChain() -> String {
        let accessToken = keyChain.get("\(userPk)") ?? ""
        return accessToken
    }
    
    func setAccessTokenIntoKetChain(token: String, key: Int) -> Bool {
        return keyChain.set(token, forKey: "\(key)", withAccess: .accessibleAfterFirstUnlock)
    }
    
    
    
    // MARK: - [ API CRUD ]

    // MARK: - GET
    
    //GET: 유저 프로필
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
    
    //GET: 최근 본 방 리스트
    func getRecentlyCheckedRooms(completion: @escaping (Result<[DabangElement], Error>) -> Void) {
        
    }
    
    
    //GET: 찜한 방 리스트
    func getMarkedRooms(completion: @escaping (Result<[DabangElement], Error>) -> Void) {
        
    }
    
    
    
    
    // MARK: - POST
    
    //POST: 유저 생성
    func postCreteUser(username: String, password: String, completion: @escaping (String,Bool) -> Void) {
        let userData = ["username" : username, "password" : password]
        AF.request( baseURL + "/members/", method: .post, parameters: userData)
            .responseJSON { (response) in
                switch response.result {
                case .success(_):
                    let succecc = "아이디가 성공적으로 생성되었습니다."
                    completion(succecc, true)
                case .failure(_):
                    let fail = "해당 사용자 이름은 이미 존재합니다."
                    completion(fail, false)
                }
        }
    }
    
    //POST: 자체 로그인
    func postUserLogin(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let loginInfo = ["username" : username, "password" : password]
        AF.request( baseURL + "/members/jwt/", method: .post, parameters: loginInfo)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let accessToken = json["jwt"].stringValue
                    self.userPk = json["user"]["pk"].intValue
                    let result = self.setAccessTokenIntoKetChain(token: accessToken, key: self.userPk)
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    //POST: 방 내놓기
    func postRoomForSale(room: DabangElement, completion: @escaping (Result<DabangElement, Error>) -> Void) {
        AF.request( baseURL + "/posts/list", method: .post, parameters: room, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: DabangElement.self) { (response) in
                switch response.result {
                case .success(let room):
                    completion(.success(room))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    //POST: 최근 본 방
    func postRecentlyCheckedRoom(pk: Int, completion: @escaping (Result<String,Error>) -> Void) {
        
    }
    
    //POST: 찜한 방
    
    
    
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
                    completion(.failure(error))
                }
        }
    }
    
    
    // MARK: - DELETE
    
    
    
    
}
