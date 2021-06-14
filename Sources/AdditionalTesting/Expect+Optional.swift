//
//  Expect+Optional.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG

import XCTest

public extension Optional {
    @discardableResult
    func expectSome(
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Optional<Wrapped> {
        switch self {
        case .some:
            return self
        case .none:
            XCTFail("expectSome failed", file: file, line: line)
            return self
        }
    }

    @discardableResult
    func expectSome(
        _ wrapped: Wrapped,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Optional<Wrapped> where Wrapped: Equatable {
        switch self {
        case let .some(foundWrapped):
            Expect.equal(wrapped, foundWrapped, "Expected a different wrapped", file, line)
            return self
        case .none:
            XCTFail("expectSome failed", file: file, line: line)
            return self
        }
    }

    @discardableResult
    func expectNone(
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Optional<Wrapped> {
        switch self {
        case .some:
            XCTFail("expectNone failed", file: file, line: line)
            return self
        case .none:
            return self
        }
    }
}
#endif
