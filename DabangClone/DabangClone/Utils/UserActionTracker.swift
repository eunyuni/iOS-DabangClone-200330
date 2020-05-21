//
//  UserActionTracker.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/05/15.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UserActionTracker {
    
    static let shared = UserActionTracker()
    
    private init() {}
    
    var latestCheckedRoom: DabangElement?
    
    var markedRoomList = [Int]()
    
    var complexAvailableRooms = PublishSubject<DabangElement>()
    
}
