//
//  Bool+Addons.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Bool {

    /// Provides the inverse value of the boolean expression. This is the functional equivilent of the preceding `!` operator.
    static func not(_ booleanExp: @autoclosure () -> Bool) -> Bool {
        !booleanExp()
    }

    /// Evaluates if the recipient's value is false.
    var isFalse: Bool { self == false }

    /// Tests that a cast from an instance to a proposed type is possible.
    static func canCast<T, U>(_ instance: T, to: U.Type) -> Bool {
        (instance as? U)
            .map { _ in true }
            .coalesce(false)
    }

}
