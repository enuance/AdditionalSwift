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
        let inputOne = true
        let inputTwo = false
        
        let expOutputOne = false
        let expOutputTwo = true
        
        let outputOne: Bool = .not(inputOne)
        let outputTwo: Bool = .not(inputTwo)
        
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
        let inputOne = true
        let inputTwo = false
        
        let expOutputOne = false
        let expOutputTwo = true
        
        let outputOne = inputOne.isFalse
        let outputTwo = inputTwo.isFalse
        
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
        let aStringInput = "A String"
        let stringDecodable: Decodable = aStringInput
        
        let outputOne: Bool = .canCast(aStringInput, to: Int.self)
        let outputTwo: Bool = .canCast(stringDecodable, to: String.self)
        let outputThree: Bool = .canCast(stringDecodable, to: Int.self)
        
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
    
    static var allTests = [
        ("test_notBooleanOperator", test_notBooleanOperator),
        ("test_isFalseBooleanProperty", test_isFalseBooleanProperty),
        ("test_canCastBooleanOperator", test_canCastBooleanOperator),
    ]
}
