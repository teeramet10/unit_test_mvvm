//
//  MockChatRoomRepository.swift
//  OneChatTestTests
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
class MockChatRoomRepository : ChatRoomRepositoryInterface{
    
    var status = "OK"
    
    init(status :String){
        self.status = status
    }
    
    func login(user: String) -> Observable<GetChatHistoryResponse> {
        return Observable<GetChatHistoryResponse>.create{event in
            let response = GetChatHistoryResponse.init()
            
            if self.status != "OK"{
                event.onError(ErrorResponse.error(status: "Failed"))
                 return Disposables.create()
            }
            
            if user == "admin"{
                response.success = true
            }else{
                response.success = false
            }
            
            response.status = self.status
            event.onNext(response)
            
            return Disposables.create()
        }
    }
    
    
    func getRoomHistory(_ token: String) -> Observable<GetChatHistoryResponse> {
        return Observable<GetChatHistoryResponse>.create{event in
            let response = GetChatHistoryResponse.init()
            
            if self.status != "OK"{
                event.onError(ErrorResponse.error(status: "Failed"))
                 return Disposables.create()
            }
            
            response.listChat = [ChatRoomModel.init()]
            response.status = self.status
            event.onNext(response)
            
            return Disposables.create()
        }
    }
    
}
