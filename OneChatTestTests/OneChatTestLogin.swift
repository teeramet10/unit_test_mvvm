//
//  OneChatTestLogin.swift
//  OneChatTestTests
//
//  Created by Teeramet on 7/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import Foundation


import XCTest
@testable import OneChatTest

class OneChatTestLogin: XCTestCase {

    
    var viewModel : ChatHistoryViewModel!
    var repository : ChatRoomRepositoryInterface!
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testlogin_error(){
         let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel(repository: MockChatRoomRepository.init(status: "Failed"))
        
        viewModel.didErrorLogin = {
            
            XCTAssert(true)
            expectation.fulfill()
        }
        
        viewModel.didSuccessLogin = {
            XCTFail()
             expectation.fulfill()
        }
        
        viewModel.didSuccessLoginFailed = {
              XCTFail()
             expectation.fulfill()
        }
        
        viewModel.login(username: "Test")
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testlogin_success(){
         let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel(repository: MockChatRoomRepository.init(status: "OK"))
        
        viewModel.didErrorLogin = {
           XCTFail()
             expectation.fulfill()
        }
        
        viewModel.didSuccessLogin = {
           XCTAssert(true)
             expectation.fulfill()
        }
        
        viewModel.didSuccessLoginFailed = {
              XCTFail()
             expectation.fulfill()
            
        }
        
        viewModel.login(username: "admin")
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testlogin_username_wrong(){
         let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel(repository: MockChatRoomRepository.init(status: "OK"))
        
        viewModel.didErrorLogin = {
            XCTFail()
             expectation.fulfill()
        }
        
        viewModel.didSuccessLogin = {
            XCTFail()
             expectation.fulfill()
        }
        
        viewModel.didSuccessLoginFailed = {
             XCTAssert(true)
             expectation.fulfill()
        }
        
        viewModel.login(username: "test")
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testlogin_username_wrong1(){
        let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel(repository: MockChatRoomRepository.init(status: "OK"))
        
        viewModel.didErrorLogin = {
            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.didSuccessLogin = {
            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.didSuccessLoginFailed = {
            XCTAssert(true)
            expectation.fulfill()
        }
        
        viewModel.login(username: "test")
        
        wait(for: [expectation], timeout: 10.0)
    }
}
