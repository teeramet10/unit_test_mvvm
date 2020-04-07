//
//  ChatRoomRepository.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper
class ChatRoomRepository : ChatRoomRepositoryInterface{
    
    func getRoomHistory(_ token: String) -> Observable<GetChatHistoryResponse> {
        
        let param = ["tokenuser" : token]
        return Observable<GetChatHistoryResponse>.create{e in
            let request =  AF.request("http://203.151.50.18:8997/web/getlistchat", method: .post, parameters: param, encoder: JSONParameterEncoder.default)
           
           request.responseObject{(response : DataResponse<GetChatHistoryResponse,AFError> ) in
        
                switch response.result{
                case .success(let value):
                    
                    if response.response?.statusCode == 200{
                        e.onNext(value)
                    }else{
                        if let error = response.error{
                            e.onError(error)
                        }
                    }
                    
                case .failure(let error):
                    e.onError(error)
                }
            
            }
            return Disposables.create()
        }
    }
    
    func login(user: String) -> Observable<GetChatHistoryResponse> {
        return Observable.empty()
    }
    
}
