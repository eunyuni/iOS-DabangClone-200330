//
//  FavoriteViewModel.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol FavoriteViewModelDelegate: class {
    func reloadTableView()
}

final class FavoriteViewModel {
    
    weak var delegate: FavoriteViewModelDelegate?
    
    private var checkedRoomData = [DabangElement]()
    private var checkedDanziData = [DanziInfo]()
    private var markedRoomData = [DabangElement]()
    private var markedDanziData = [DanziInfo]()
    private var contactBudongsanData = [Broker]()
    
    var dataIndex = 0 {
        didSet {
            setActiveData(dataIndex)
        }
    }
    
    lazy var activeData = FavoriteData.checkedRoomInfo(checkedRoomData)
    
    lazy var data: [FavoriteData] = [
        .checkedRoomInfo(checkedRoomData),
        .checkedDanziInfo(checkedDanziData),
        .markedRoomInfo(markedRoomData),
        .markedDanziInfo(markedDanziData),
        .budongsanInfo(contactBudongsanData)
    ]
    
    init() {
//        APIManager.shared.checkJWTExpiration()
        tempLocalLogin()
//        tempLocalCreateUser()

        
        
//        fetchCheckedRoomData()
//        fetchMarkedRoomData()
//        fetchContactedBrokersData()
        
        checkedDanziData = [dummyDanzi,dummyDanzi,dummyDanzi,dummyDanzi]
        markedDanziData = [dummyDanzi, dummyDanzi,dummyDanzi,dummyDanzi,dummyDanzi]
//        contactBudongsanData = [dummyBudongsan,dummyBudongsan2]
    }
    
    func tempLocalCreateUser() {
        APIManager.shared.postCreteUser(username: "temp3", password: "1231233") { (message, isSuccess) in
            if isSuccess {
                print(message)
                self.tempLocalLogin()
            } else {
                print("실패")
            }
            
        }
    }
    
    func tempLocalLogin() {
        APIManager.shared.postUserLogin(username: "temp3", password: "1231233") { (result) in
            switch result {
            case .success(_):
                print("자체 로그인 성공")
                let accessToken = APIManager.shared.getAccessTokenFromKeyChain()
                print(accessToken)
                APIManager.shared.getUserProfile { (result) in
                    switch result {
                    case .success(let user):
                        print("유저 정보 로드 성공")
                        UserData.shared.user = user
                        self.checkedRoomData = UserData.shared.user.recentlyCheckedRooms ?? []
//                        self.tempUserInfoUpdate()
                        self.delegate?.reloadTableView()
                    case .failure(let error):
                        print("유저 정보 로드 실패")
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func tempUserInfoUpdate() {
        APIManager.shared.patchUpdateUserInfo(phone: "010-3333-7777", image: "imageURL") { (result) in
            switch result {
            case .success(let user):
                UserData.shared.user = user
                print("수정된 유저", UserData.shared.user)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCheckedRoomData() {
        APIManager.shared.getEntireRoomData { (result) in
                    switch result {
                    case .success(let rooms):
                        self.checkedRoomData = rooms
                        print("checkedRoom success")
                        self.delegate?.reloadTableView()
                    case .failure(let error):
                        print(error)
                    }
                    
                }
    }
    
    func fetchMarkedRoomData() {
        APIManager.shared.getEntireRoomData { (result) in
                    switch result {
                    case .success(let rooms):
                        self.markedRoomData = rooms
                        print("markeRoom success")
                        self.delegate?.reloadTableView()
                    case .failure(let error):
                        print(error)
                    }
                    
                }
    }

    func fetchContactedBrokersData() {
        APIManager.shared.getUserProfile { (result) in
            switch result {
            case .success(let user):
                self.contactBudongsanData = user.contactedBrokers ?? []
            case .failure(let error):
                print(error)
            }
            self.delegate?.reloadTableView()
        }
    }
    
    func setActiveData(_ dataIndex: Int) {
        activeData = data[dataIndex]
    }
    
    func checkActiveDataCount() -> Int {
        switch activeData {
        case .checkedRoomInfo(let rooms):
            print("check data count:", rooms.count)
            return rooms.count
        case .checkedDanziInfo(let danzis):
            return danzis.count
        case .markedRoomInfo(let rooms):
            return rooms.count
        case .markedDanziInfo(let danzis):
            return danzis.count
        case .budongsanInfo(let budongsans):
            return budongsans.count
        }
    }
    
    func checkActiveDataAndSetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, on viewController: FavoriteListViewController) -> UITableViewCell {
        switch activeData {
        case .checkedRoomInfo(let rooms):
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoCell.identifier, for: indexPath) as! RoomInfoCell
            cell.set(roomInfo: rooms[indexPath.row])
            return cell
        case .checkedDanziInfo(let danzis):
            let cell = tableView.dequeueReusableCell(withIdentifier: DanziInfoCell.identifier, for: indexPath) as! DanziInfoCell
            cell.set(danziInfo: danzis[indexPath.row])
            return cell
        case .markedRoomInfo(let rooms):
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomInfoCell.identifier, for: indexPath) as! RoomInfoCell
            cell.delegate = viewController
            cell.set(roomInfo: rooms[indexPath.row])
            return cell
        case .markedDanziInfo(let danzis):
            let cell = tableView.dequeueReusableCell(withIdentifier: DanziInfoCell.identifier, for: indexPath) as! DanziInfoCell
            cell.set(danziInfo: danzis[indexPath.row])
            return cell
        case .budongsanInfo(let budongsan):
            let cell = tableView.dequeueReusableCell(withIdentifier: BudongsanInfoCell.identifier, for: indexPath) as! BudongsanInfoCell
            cell.set(info: budongsan[indexPath.row])
            return cell
        }
        
    }
}
