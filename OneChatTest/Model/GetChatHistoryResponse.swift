//
//  GetChatHistoryResponse.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class GetChatHistoryResponse  : Mappable{
    
    
    required init?(map: Map) {
        
    }
    
    init(){
        
    }
    
    var  listChat : [ChatRoomModel]? = []
    var  status : String? = ""
    var  success : Bool? = false
    
    func mapping(map: Map) {
        listChat <- map["listchat"]
        status <- map["status"]
        success <- map["success"]
    }
    
}
