//
//  Optional+Result.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Optional {
    /// Uses a provided Error to convert an `Optional` type into a `Result` type.
    ///
    ///     // A Failure Type to default to if the optional is nil
    ///     enum EpicFail: Error { case boom }
    ///
    ///     // An Optional<Int> set to .some(12)
    ///     let optionalNum: Int? = 12
    ///
    ///     // Convert the optional by providing an Error
    ///     let numberResult = optionalNum.result(EpicFail.boom)
    ///
    ///     // The optional has been transformed into a Result
    ///     // numberResult == Result<Int, EpicFail>.success(12)
    ///
    /// - parameters:
    ///     - errorIfNil: The error to default to if the optional was nil
    ///
    /// - returns: The transformed `Optional<Wrapped>` now as a `Result` type
    ///
    func result<E: Swift.Error>(_ errorIfNil: E) -> Result<Wrapped, E> {
        switch self {
        case let .some(value):
            return .success(value)
        case .none:
            return.failure(errorIfNil)
        }
    }
    
    /// Converts an `Optional` type into a `Result` type.
    ///
    /// If the value is `nil` the result will produce a failure of `Optional.Error.absentValue`
    ///
    var result: Result<Wrapped, Error> {
        switch self {
        case let .some(value):
            return .success(value)
        case .none:
            return.failure(.absentValue)
        }
    }

    /// A specialized `flatMap` that operates on Optionals where 1, the transform output desired is a `Result` type and 2, the
    /// overall returned type desired is a `Result` type.
    ///
    ///     // A Failure Type for the `Result`
    ///     enum EpicFail: Error { case boom }
    ///
    ///     // Some Type that contains a Result
    ///     struct SomeType { let aResult: Result<Int, EpicFail> }
    ///
    ///     // Some Optional type that happens to contain a Result type
    ///     let someOptional: SomeType? = nil
    ///
    ///     // Now aResult is a `Result<Int?, EpicFail>`. A normal map
    ///     // would have resulted in a `Result<Int, EpicFail>?`
    ///     let aResult = someOptional.resultFlatMap(\.aResult)
    ///
    /// - parameters:
    ///     - transform: A closure that provides the `Optional`'s wrapped value and returns a `Result` where the
    ///     success type is the transformed instance of that wrapped value (`NewSuccess`).
    ///
    /// - returns: A result type where the `NewSuccess` is an optional version of the tranformed `Wrapped` instance.
    ///
    func resultFlatMap<E: Swift.Error, NewSuccess>(
        _ transform: (Wrapped) -> Result<NewSuccess, E>
    ) -> Result<NewSuccess?, E> {
        switch self {
        case let .some(value):
            return transform(value).map(Optional<NewSuccess>.some)
        case .none:
            return .success(.none)
        }
    }
}
