//
//  Expect+Collection.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/12/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG
import XCTest

public extension Expect {
    final class Collection<Element, Failure: Swift.Error> {
        public typealias Output = Result<[Element], Failure>

        private let expectation = XCTestExpectation(description: "Expect.Collection")
        private let limit: Int
        private let timeout: TimeInterval
        private var collection: [Element]
        private var failure: Failure?
        private let file: StaticString
        private let line: UInt

        public init(
            limit: Int,
            timeout: TimeInterval = 5,
            starting collection: [Element] = [],
            _ file: StaticString = #file,
            _ line: UInt = #line
        ) {
            self.limit = limit
            self.timeout = timeout
            self.collection = collection
            self.file = file
            self.line = line
        }

        public var collect: (Element) -> Void {
            return { [weak self] element in
                guard let self = self else {
                    XCTFail(
                        "Expect.Collection failed: No longer in scope",
                        file: #file,
                        line: #line
                    )
                    return
                }
                self.collection.append(element)
            }
        }

        public func collect(failure: Failure) {
            self.failure = failure
            expectation.fulfill()
        }

        public var output: Output {
            guard let foundFailure = failure else {
                return .success(collection)
            }

            return .failure(foundFailure)
        }

        public func fulfill() {
            expectation.fulfill()
        }

        public func wait() {
            let waiter = XCTWaiter()
            if waiter.wait(for: [expectation], timeout: timeout) == .timedOut {
                XCTFail("Expect.Collection failed: timedOut", file: file, line: line)
            }
        }

    }
}
#endif
