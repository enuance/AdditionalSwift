//
//  XCTest+Result.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

// TODO: xctest-dynamic-overlay from pointfree

//#if canImport(XCTest)
//import XCTest
//
//public extension XCTest {
//    struct Error: Swift.Error {
//        public let info: String
//
//        public init(info: String) {
//            self.info = info
//        }
//    }
//
//    static func fulfill<C: Collection>(
//        _ expectation: XCTestExpectation,
//        when outputs: C,
//        reaches count: Int
//    ) {
//        guard outputs.count == count else { return }
//        expectation.fulfill()
//    }
//
//    static func url(from urlString: String) -> Result<URL, Error> {
//        guard let url = URL(string: urlString) else {
//            return .failure(Error(info: "Couldn't build URL from \(urlString)"))
//        }
//        return .success(url)
//    }
//
//    static func httpResponse(
//        url: URL,
//        statusCode: Int,
//        headerFields: [String: String]? = nil
//    ) -> Result<HTTPURLResponse, Error> {
//        let httpResponse = HTTPURLResponse(
//            url: url,
//            statusCode: statusCode,
//            httpVersion: nil,
//            headerFields: headerFields
//        )
//
//        guard let response = httpResponse else {
//            let info = "Couldn't build Response from provided url, status, and fields"
//            return .failure(Error(info: info))
//        }
//
//        return .success(response)
//    }
//}
//#endif
