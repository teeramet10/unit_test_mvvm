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
    
    var didSuccessLogin : (() -> Void)?
    var didSuccessLoginFailed : (()->Void)?
    var didErrorLogin:(()->Void)?
    
    var showResultCaculate : ((String)->Void)?
    
    
    var repository : ChatRoomRepositoryInterface?
    
    var getRoomHistoryDispose : Disposable?
    
    init(repository :ChatRoomRepositoryInterface ){
        self.repository = repository
    }
    
    
    func login( username : String){
         repository?.login(user: username)
               .observeOn(MainScheduler.instance)
               .subscribeOn( SerialDispatchQueueScheduler.init(qos: .background))
               .subscribe(onNext: {response in
                if (response.success ?? false) {
                    self.didSuccessLogin?()
                }else{
                    self.didSuccessLoginFailed?()
                }
               }, onError: {error in
                self.didErrorLogin?()
           }, onCompleted: nil, onDisposed: nil)
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
    
    func calculate(a : Double , b:Double){
        let result = a+b
        showResultCaculate?("\(result)")
    }
}
