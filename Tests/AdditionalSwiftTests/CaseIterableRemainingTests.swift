//
//  CaseIterableRemainingTests.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import XCTest
import Combine
import AdditionalTesting

@testable import AdditionalSwift


final class CaseIterableRemainingTests: XCTestCase {
    enum IterableEnum: String, CaseIterable, Equatable {
        case one
        case two
        case three
        case four
        case five
    }

    func test_RemainingCasesShouldProduceAllWhenFirstIsUsed() {
        // Arrange
        let expOutput: [IterableEnum] = [
            .one,
            .two,
            .three,
            .four,
            .five
        ]

        // Act
        let output = IterableEnum.one.remainingCases

        // Assert
        XCTAssertEqual(expOutput, output, "remaining cases should have produced all cases")
    }

    func test_RemainingCasesShouldProduceOnlyOneCaseWhenLastUsed() {
        // Arrange
        let expOutput: [IterableEnum] = [.five]

        // Act
        let output = IterableEnum.five.remainingCases

        // Assert
        XCTAssertEqual(expOutput, output, "remaining cases should have produced the 'five' case")
    }

    func test_RemainingCasesShouldIncludeTheCaseItsCalledOn() {
        // Arrange
        let expOutput: [IterableEnum] = [
            .three,
            .four,
            .five
        ]

        let iterableCase = IterableEnum.three

        // Act
        let output = iterableCase.remainingCases

        // Assert
        XCTAssertEqual(expOutput, output, "remaining cases should have produced three four and five")
        XCTAssertTrue(expOutput.contains(iterableCase), "the case 'three' should be contained in the output")
    }

    func test_NextCaseShouldUseTheNextAvailableCase() {
        // Arrange
        let initialContent: [IterableEnum] = [
            .one,
            .two,
            .three,
            .four
        ]

        let expOutput: [IterableEnum] = [
            .two,
            .three,
            .four,
            .five
        ]

        // Act
        let output = initialContent.compactMap(\.nextCase)

        // Assert
        XCTAssertEqual(expOutput, output, "next case should have produced the next available case")
    }

    func test_NextCaseShouldBeNilIfNoneAreLeft() {
        // Arrange
        let expOutput: IterableEnum? = .none

        // Act
        let output = IterableEnum.five.nextCase

        // Assert
        XCTAssertEqual(expOutput, output, "next case should be nil when none are left")
    }
}
