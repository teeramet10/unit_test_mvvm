//
//  ChatHistoryModel.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
import ObjectMapper
class ChatRoomModel  : Mappable{

    var name : String? = ""
    var message  : String? = ""
    var picture  : String? = ""
    var typeofmessage  : String? = ""
    var nickname  : String? = ""
    var state  : String? = ""
    var timestamp  : String? = ""
    var tokenroom  : String? = ""
    var tokenuser  : String? = ""
    var type  : String? = ""
    var createDate  : String? = ""
    var countRead  : String? = ""
    var countMember  : String? = ""
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        message <- map["message"]
        picture <- map["picture"]
        typeofmessage <- map["typeofmessage"]
        nickname <- map["nickname"]
        state <- map["state"]
        timestamp <- map["timestamp"]
        tokenroom <- map["tokenroom"]
        tokenuser <- map["tokenuser"]
        type <- map["type"]
        createDate <- map["create_date"]
        countRead <- map["count_read"]
        countMember <- map["count_member"]
    }
}
