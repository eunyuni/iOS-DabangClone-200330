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
    private var contactBudongsanData = [BudongsanInfo]()
    
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
        fetchCheckedRoomData()
        fetchMarkedRoomData()
        checkedDanziData = [dummyDanzi,dummyDanzi,dummyDanzi,dummyDanzi]
        markedDanziData = [dummyDanzi, dummyDanzi,dummyDanzi,dummyDanzi,dummyDanzi]
        contactBudongsanData = [dummyBudongsan,dummyBudongsan2]
    }
    
    func fetchCheckedRoomData() {
        APIManager.shared.getEntireRoomData { (result) in
                    switch result {
                    case .success(let rooms):
                        self.checkedRoomData = rooms
                        print("checkedRoom success")
                    case .failure(let error):
                        print(error)
                    }
                    self.delegate?.reloadTableView()
                }
    }
    
    func fetchMarkedRoomData() {
        APIManager.shared.getEntireRoomData { (result) in
                    switch result {
                    case .success(let rooms):
                        self.markedRoomData = rooms
                        print("markeRoom success")
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
