//
//  CollectionSafeIndexTests.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import XCTest

@testable import AdditionalSwift

final class CollectionSafeIndexTests: XCTestCase {

    func test_indexAboveRangeReturnsNone() {
        // Arrange
        let collection = [1, 2, 3, 5, 8, 13, 21]
        let index = 8

        // Act
        let output = collection[safe: index]

        // Assert
        XCTAssertNil(output)
    }

    func test_indexBelowRangeReturnsNone() {
        // Arrange
        let collection = [1, 2, 3, 5, 8, 13, 21]
        let index = -1

        // Act
        let output = collection[safe: index]

        // Assert
        XCTAssertNil(output)
    }

    func test_indexWithinRangeReturnsValue() {
        // Arrange
        let collection = [1, 2, 3, 5, 8, 13, 21]
        let indices = [0, 1, 2, 3, 4, 5, 6]

        // Act
        let output = indices.compactMap { collection[safe: $0] }

        // Assert
        let expectedOutput = [1, 2, 3, 5, 8, 13, 21]
        XCTAssertEqual(output, expectedOutput)
    }
}
