//
//  BoolAddonsTests.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 5/5/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import XCTest
@testable import AdditionalSwift

final class BoolAddonsTests: XCTestCase {
    func test_notBooleanOperator() {
        // Arrange
        let inputOne = true
        let inputTwo = false

        let expOutputOne = false
        let expOutputTwo = true

        // Act
        let outputOne: Bool = .not(inputOne)
        let outputTwo: Bool = .not(inputTwo)
        
        // Assert
        XCTAssertEqual(
            outputOne,
            expOutputOne,
            "Expected the not operator to invert from true to false"
        )

        XCTAssertEqual(
            outputTwo,
            expOutputTwo,
            "Expected the not operator to invert from false to true"
        )
    }

    func test_isFalseBooleanProperty() {
        // Arrange
        let inputOne = true
        let inputTwo = false

        let expOutputOne = false
        let expOutputTwo = true

        // Act
        let outputOne = inputOne.isFalse
        let outputTwo = inputTwo.isFalse

        // Assert
        XCTAssertEqual(
            outputOne,
            expOutputOne,
            "Expected that true is not false and should return false"
        )

        XCTAssertEqual(
            outputTwo,
            expOutputTwo,
            "Expected that false is false and should return true"
        )
    }

    func test_canCastBooleanOperator() {
        // Arrange
        let aStringInput = "A String"
        let stringDecodable: Decodable = aStringInput

        // Act
        let outputOne: Bool = .canCast(aStringInput, to: Int.self)
        let outputTwo: Bool = .canCast(stringDecodable, to: String.self)
        let outputThree: Bool = .canCast(stringDecodable, to: Int.self)

        // Assert
        XCTAssertEqual(
            outputOne,
            false,
            "Expected that a cast from String to Int should return false"
        )

        XCTAssertEqual(
            outputTwo,
            true,
            "Expected that a cast from Decodable-String to String should return true"
        )

        XCTAssertEqual(
            outputThree,
            false,
            "Expected that a cast from Decodable-String to Int should return false"
        )
    }
}
