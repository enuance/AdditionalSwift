//
//  Expect+Assertions.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG

import Foundation
import XCTest

public extension Expect {
    static func `true`(
        _ bool: @autoclosure () -> Bool,
        _ message: @autoclosure () -> String = "",
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        let shouldFail = bool() != true

        func composeMessage() -> String {
            let userMessage = message()
            let initialMessage = "Expect.true failed"
            let shouldAppend = !userMessage.isEmpty
            return shouldAppend
                ? initialMessage.appending(" - " + userMessage)
                : initialMessage
        }

        if shouldFail { XCTFail(composeMessage(), file: file, line: line) }
    }

    static func `false`(
        _ bool: @autoclosure () -> Bool,
        _ message: @autoclosure () -> String = "",
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        let shouldFail = bool() != false

        func composeMessage() -> String {
            let userMessage = message()
            let initialMessage = "Expect.false failed"
            let shouldAppend = !userMessage.isEmpty
            return shouldAppend
                ? initialMessage.appending(" - " + userMessage)
                : initialMessage
        }

        if shouldFail { XCTFail(composeMessage(), file: file, line: line) }
    }

    static func equal<T: Equatable>(
        _ firstExpression: @autoclosure () -> T,
        _ secondExpression: @autoclosure () -> T,
        _ message: @autoclosure () -> String = "",
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) {
        let firstValue = firstExpression()
        let secondValue = secondExpression()
        let shouldFail = firstValue != secondValue

        func composeMessage() -> String {
            let first = String(describing: firstValue)
            let second = String(describing: secondValue)
            let userMessage = message()
            let initialMessage = #"Expect.equal failed: ("\#(first)") is not equal to ("\#(second)")"#
            let shouldAppend = !userMessage.isEmpty
            return shouldAppend
                ? initialMessage.appending(" - " + userMessage)
                : initialMessage
        }

        if shouldFail { XCTFail(composeMessage(), file: file, line: line) }
    }

//    static func `continue`<C: Collection>(
//        when collection: C,
//        reaches count: Int
//    ) {
//        let semaphore = DispatchSemaphore(value: 0)
//    }

}

//    static func fulfill<C: Collection>(
//        _ expectation: XCTestExpectation,
//        when outputs: C,
//        reaches count: Int
//    ) {
//        guard outputs.count == count else { return }
//        expectation.fulfill()
//    }

#endif
