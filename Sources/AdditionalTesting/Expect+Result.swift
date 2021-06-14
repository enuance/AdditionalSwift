//
//  XCTest+Result.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG

import XCTest

public extension Result {
    @discardableResult
    func expectSuccess(
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Result<Success, Failure> {
        switch self {
        case .success:
            return self
        case let .failure(error):
            XCTFail(error.localizedDescription, file: file, line: line)
            return self
        }
    }

    @discardableResult
    func expectSuccess(
        _ success: Success,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Result<Success, Failure> where Success: Equatable {
        switch self {
        case let .success(foundSuccess):
            Expect.equal(success, foundSuccess, "Expected a different success", file, line)
            return self
        case let .failure(error):
            XCTFail(error.localizedDescription, file: file, line: line)
            return self
        }
    }

    @discardableResult
    func expectFailure(
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Result<Success, Failure> {
        switch self {
        case .success:
            XCTFail("Result Should Have Failed", file: file, line: line)
            return self
        case .failure:
            return self
        }
    }

    @discardableResult
    func expectFailure(
        _ failure: Failure,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Result<Success, Failure> where Failure: Equatable {
        switch self {
        case .success:
            XCTFail("Result Should Have Failed", file: file, line: line)
            return self
        case let .failure(foundFailure):
            Expect.equal(failure, foundFailure, "Expected a different failure", file, line)
            return self
        }
    }
}
#endif
