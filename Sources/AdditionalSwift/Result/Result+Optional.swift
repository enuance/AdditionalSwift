//
//  File.swift
//
//  Result+Optional.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

internal extension Result {

    /// Converts an `Result<T, Error>` into an `Optional<T>`.
    var optional: Success? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }

}

