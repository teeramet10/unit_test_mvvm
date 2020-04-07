//
//  ChatRoomRepositoryInterface.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
protocol ChatRoomRepositoryInterface {
    func getRoomHistory(_ token :String) -> Observable<GetChatHistoryResponse>
}
