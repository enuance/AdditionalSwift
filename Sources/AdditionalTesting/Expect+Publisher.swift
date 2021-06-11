//
//  Expect+Publisher.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/9/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG
#if canImport(Combine)

import Combine
import Foundation
import XCTest

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher {
    typealias Record = Result<[Output], Failure>

    /// A Test Operator that subscribes to the Publisher and blocks while it aggregates the output into a Result type
    ///
    /// - parameters:
    ///   - timeout: A maximum time that the operator is allowed to collect output from the Publisher.
    ///   - limit: A maximum amount of output from the Publisher that should be collected. 0 disables the limit.
    ///   - testTasks: Environmental testing tasks that should be run directly after subscription.
    ///
    /// - returns: A Publisher Collection that contains a list of all the output or the provided failure
    ///
    func expectRecord(
        timeout: TimeInterval = 5,
        limit: Int = 0,
        testTasks: () -> Void = { },
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) -> Record {
        var collected: [Output] = []
        var failure: Failure?
        var cancellables = Set<AnyCancellable>()
        let expectation = XCTestExpectation(description: "expectRecord")

        sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case let .failure(error):
                    failure = error
                    expectation.fulfill()
                }
            },
            receiveValue: { value in
                let shouldFulfill = collected.count == limit && limit != 0
                let shouldAppend = collected.count < limit || limit == 0
                if shouldFulfill { expectation.fulfill() }
                if shouldAppend { collected.append(value) }
            }
        )
        .store(in: &cancellables)

        testTasks()
        
        let waiter = XCTWaiter()
        
        if waiter.wait(for: [expectation], timeout: timeout) == .timedOut {
            XCTFail("expectRecord failed: timedOut", file: file, line: line)
        }

        guard let foundFailure = failure else {
            return .success(collected)
        }

        return .failure(foundFailure)
    }
}

#endif
#endif
