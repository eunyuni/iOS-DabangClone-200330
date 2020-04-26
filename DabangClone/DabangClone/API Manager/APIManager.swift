//
//  APIManager.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/24.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    let accessToken = ""
    let networkAccessManager = NetworkReachabilityManager(host: "https://moonpeter.com")
    private init() { monitorNetworkAccessStatus() }
    
    let baseURL = "https://moonpeter.com"
    
    private func monitorNetworkAccessStatus() {
        networkAccessManager?.startListening(onQueue: .init(label: "networkQueue"), onUpdatePerforming: { (status) in
            print("Network Status has been changed: \(status)")
        })
    }
    
    // MARK: - [ API CRUD ]
    
    // MARK: - GET
    
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
    
    
    
}
