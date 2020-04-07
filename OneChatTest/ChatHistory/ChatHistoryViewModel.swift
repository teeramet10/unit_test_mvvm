//
//  ChatHistoryViewModel.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
class ChatHistoryViewModel{
    
    var listChat : [ChatRoomModel]? = []
    
    
    var didSuccessGetChatHistory : ((GetChatHistoryResponse)->Void)?
    var didErrorGetChatHistory : ((Error)->Void)?
    
    
    var repository : ChatRoomRepositoryInterface?
    
    var getRoomHistoryDispose : Disposable?
    
    init(repository :ChatRoomRepositoryInterface ){
        self.repository = repository
    }
    
    func getChatHistory(){
        
        getRoomHistoryDispose = repository?.getRoomHistory("U51ad1a6180a552f88bbbccbbe21bf7c2")
            .observeOn(MainScheduler.instance)
            .subscribeOn( SerialDispatchQueueScheduler.init(qos: .background))
            .subscribe(onNext: {response in
                self.listChat = response.listChat
                self.didSuccessGetChatHistory?(response)
            }, onError: {error in
                self.didErrorGetChatHistory?(error)
        }, onCompleted: nil, onDisposed: nil)
     
    }
}
