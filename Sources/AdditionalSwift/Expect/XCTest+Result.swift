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
//public extension Result {
//    @discardableResult
//    func assertSuccess() -> Result<Success, Failure> {
//        switch self {
//        case .success:
//            return self
//        case let .failure(error):
//            XCTFail(error.localizedDescription)
//            return self
//        }
//    }
//
//    @discardableResult
//    func assertSuccess(
//        _ success: Success
//    ) -> Result<Success, Failure> where Success: Equatable {
//        switch self {
//        case let .success(foundSuccess):
//            XCTAssertEqual(success, foundSuccess, "Expected a different success")
//            return self
//        case let .failure(error):
//            XCTFail(error.localizedDescription)
//            return self
//        }
//    }
//
//    @discardableResult
//    func assertFailure(
//    ) -> Result<Success, Failure> where Failure: Equatable {
//        switch self {
//        case .success:
//            XCTFail("Result Should Have Failed")
//            return self
//        case .failure:
//            return self
//        }
//    }
//
//    @discardableResult
//    func assertFailure(
//        _ failure: Failure
//    ) -> Result<Success, Failure> where Failure: Equatable {
//        switch self {
//        case .success:
//            XCTFail("Result Should Have Failed")
//            return self
//        case let .failure(foundFailure):
//            XCTAssertEqual(failure, foundFailure, "Expected a different failure")
//            return self
//        }
//    }
//}
//#endif
