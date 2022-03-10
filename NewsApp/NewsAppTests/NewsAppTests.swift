//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Neha Vishnoi on 10/03/22.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchNewShouldPass() throws {
        let service = Service()
        let exception = expectation(description: "200")
        service.getNewsList(urlString: Constant.URL) { news in
            XCTAssert(!news.isEmpty)
            exception.fulfill()
        }
        wait(for: [exception], timeout: 10)
    }

    func testFetchNewShouldFail() throws {
        let service = Service()
        let exception = expectation(description: "200")
        service.getNewsList(urlString: "abcd") { news in
            XCTAssert(news.isEmpty)
            exception.fulfill()
        }
        wait(for: [exception], timeout: 10)
    }

}
