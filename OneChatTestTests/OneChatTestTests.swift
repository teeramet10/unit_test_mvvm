//
//  OneChatTestTests.swift
//  OneChatTestTests
//
//  Created by Teeramet on 5/4/2563 BE.
//  Copyright © 2563 Teeramet. All rights reserved.
//

import XCTest
@testable import OneChatTest

class OneChatTestTests: XCTestCase {

    var viewModel : ChatHistoryViewModel!
    var repository : ChatRoomRepositoryInterface!
    
    override func setUp() {
        super.setUp()
    }
    
    func testGetChatHistorySuccess(){
        
        let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel.init(repository: MockChatRoomRepository.init(status: "OK"))
        
        viewModel.didSuccessGetChatHistory = { response in
            XCTAssert(response.listChat?.count ?? 0 > 0)
            XCTAssert(response.status == "OK")
            XCTAssert(true)
            expectation.fulfill()
           
        }
        
        viewModel.didErrorGetChatHistory = {error in
            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.getChatHistory()
        
         wait(for: [expectation], timeout: 10.0)
    }
    
    func testFailedGetChatHistorySuccess(){
        let expectation = XCTestExpectation(description: "Get Chat History API")
        
        
        viewModel = ChatHistoryViewModel.init(repository: MockChatRoomRepository.init(status: "Failed"))
        viewModel.didSuccessGetChatHistory = { response in
            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.didErrorGetChatHistory = {error in
            XCTAssert(true)
//            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.getChatHistory()
        
         wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetChatHistoryFailed(){
        let expectation = XCTestExpectation(description: "Get Chat History API")
        
        viewModel = ChatHistoryViewModel.init(repository: MockChatRoomRepository.init(status: "Failed"))
        viewModel.didSuccessGetChatHistory = { response in
           XCTAssert(response.listChat == nil)
//           XCTFail()
            XCTFail()
           
            expectation.fulfill()
     
        }
        
        viewModel.didErrorGetChatHistory = {error in
            XCTAssert(true)
    
            expectation.fulfill()
        }
        
        viewModel.getChatHistory()
        
         wait(for: [expectation], timeout: 10.0)
    }
    

}
