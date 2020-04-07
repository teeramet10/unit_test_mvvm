//
//  ErrorResponse.swift
//  OneChatTest
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation
enum ErrorResponse : Error{
    
    case error( errorMessage :String )
     case error( status :String )
    case errorResponse( status: Int , errorMessage :String )
}
