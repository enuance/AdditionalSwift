//
//  Result+Coalesce.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Result {

    /// Uses a default value to extract the Success value. The default will be provided if it was a failure to begin with.
    func coalesce(_ defaultValue: Success) -> Success {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return defaultValue
        }
    }

    /// Uses a default action to extract the Success value. The default will be provided if it was a failure to begin with.
    func coalesce(_ coalescingAction: () -> Success) -> Success {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return coalescingAction()
        }
    }
    
    // Result Failure Coalescing Operator
    static func ?? <T, Err: Swift.Error>(
        _ result: Result<T, Err>,
        _ defaultValue: @autoclosure () -> T
        ) -> T {
        switch result {
        case let .success(value):
            return value
        case .failure:
            return defaultValue()
        }
    }

}
