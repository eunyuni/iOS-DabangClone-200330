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
    private var checkedDanziData = [Complex]()
    private var markedRoomData = [DabangElement]()
    private var markedDanziData = [Complex]()
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
        print("FavoViewModel init")
        
//        APIManager.shared.getUserProfile(userPK: 1) { (result) in
//            switch result {
//            case .success(let user):
//                print(type(of: user))
//            case .failure(let error):
//                print(error)
//            }
//        }
        fetchRecentlyCheckedRooms()
        fetchCheckedComplex()
        fetchMarkedRooms()
        fetchMarkedComplex()
        fetchContactedBrokersData()
    }
    
    
    
    func fetchAllData() {
        APIManager.shared.getUserProfile { (result) in
            switch result {
            case .success(let user):
                self.checkedRoomData = user.recentlyCheckedRooms ?? []
                self.markedRoomData = user.markedRooms ?? []
                self.delegate?.reloadTableView()
            case .failure(let error):
                print("failed to fetch favorite data:", error)
            }
        }
    }
    func tempLocalCreateUser() {
        APIManager.shared.postCreteUser(username: "testname123", password: "123123", email: "testEmail@gmail.com") { (message, isSuccess) in
            if isSuccess {
                print(message)
//                self.tempLocalLogin()
            } else {
                print("실패")
            }
        }
    }

    func fetchMarkedComplex() {
        APIManager.shared.getMarkedComplexList { (result) in
            switch result {
            case .success(let complexs):
                self.markedDanziData = complexs
                self.delegate?.reloadTableView()
                print("fetchMarkedComplex")
            case .failure(let error):
                print("failed to fetch marked complex: ", error)
            }
        }
    }
    
    func fetchCheckedComplex() {
        APIManager.shared.getRecentlyCheckedComplexList { (result) in
            switch result {
            case .success(let complexs):
                self.checkedDanziData = complexs
                self.delegate?.reloadTableView()
                print("fetchCheckedComplex")
            case .failure(let error):
                print("failed to fetch checked complex: ", error)
            }
        }
    }
    
    func fetchMarkedRooms() {
        APIManager.shared.getMarkedRooms { (result) in
            switch result {
            case .success(let rooms):
                self.markedRoomData = rooms
                self.delegate?.reloadTableView()
                print("fetchMarkedRooms")
            case .failure(let error):
                print("failed to fetch marked rooms: ", error)
            }
        }
    }
    
    func fetchRecentlyCheckedRooms() {
        APIManager.shared.getRecentlyCheckedRooms { (result) in
            switch result {
            case .success(let rooms):
                self.checkedRoomData = rooms
                self.delegate?.reloadTableView()
                print("fetchRecentlyCheckedRooms")
            case .failure(let error):
                print("failed to fetch recently checked rooms: ", error)
            }
        }
    }
    
    func fetchContactedBrokersData() {
        APIManager.shared.getContactedBrokerList { (result) in
            switch result {
            case .success(let brokers):
                self.contactBudongsanData = brokers
                self.delegate?.reloadTableView()
                print("fetchContactedBrokersData")
            case .failure(let error):
                print("failed to fetch broker list: ", error)
            }
        }
    }
    
    func setActiveData(_ dataIndex: Int) {
//        switch dataIndex {
//        case 0:
//            fetchRecentlyCheckedRooms()
//        case 1:
//            fetchCheckedComplex()
//        case 2:
//            fetchMarkedRooms()
//        case 3:
//            fetchMarkedComplex()
//        case 4:
//            fetchContactedBrokersData()
//        default:
//            break
//        }
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
