//
//  Optional+Get.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 5/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Optional {
    /// The `Optional` error used when handling the `none` case in a throwing fashion.
    ///
    ///  There is only one error case that can occur, which is the `absentValue` error.
    ///
    enum Error: Swift.Error { case absentValue }
    
    /// Returns the `Wrapped` value as a throwing expression
    ///
    /// Use this method to retrieve the value of this optional if it represents a some, or to catch the value if it represents a none.
    ///
    ///  - returns: The `Wrapped` value, if the instance represents a some.
    ///
    func get() throws -> Wrapped {
        switch self {
        case let .some(value):
            return value
        case .none:
            throw Error.absentValue
        }
    }
}
