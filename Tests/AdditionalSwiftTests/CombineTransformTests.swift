//
//  CombineTransformTests.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import AdditionalTesting
import Combine
import XCTest

@testable import AdditionalSwift

final class CombineTransformTests: XCTestCase {
    func test_transformSignalChangesValuesIntoSignals() {
        // Arrange
        let publisher = PassthroughSubject<Int, Never>()

        // Act
        let output = publisher
            .transformSignal()
            .expectRecord(limit: 3) {
                publisher.send(12)
                publisher.send(4)
                publisher.send(5)
            }

        // Assert
        let expectedOutput = [Signal(), Signal(), Signal()]
        output.expectSuccess(expectedOutput)
    }

    func test_transformToChangesValuesIntoChosenValues() {
        // Arrange
        let publisher = PassthroughSubject<Int, Never>()

        // Act
        let output = publisher
            .transform(to: "value")
            .expectRecord(limit: 3) {
                publisher.send(12)
                publisher.send(4)
                publisher.send(5)
            }

        // Assert
        let expectedOutput = ["value", "value", "value"]
        output.expectSuccess(expectedOutput)
    }

    func test_transformChangesValuesIntoVoid() {
        // Arrange
        let publisher = PassthroughSubject<Int, Never>()

        // Act
        let output = publisher
            .transform()
            .expectRecord {
                publisher.send(12)
                publisher.send(4)
                publisher.send(5)
                publisher.send(completion: .finished)
            }

        // Assert
        //   Note: `Void` is not equatable or comparable. The quantity
        //   of Void instances is all we are able to assert against
        output
            .map(\.count)
            .expectSuccess(3)
    }
}
