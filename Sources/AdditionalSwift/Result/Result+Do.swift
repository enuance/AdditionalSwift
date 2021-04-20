//
//  Result+Do.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Result {
    
    /// Do side-effects in an explicit way
    @discardableResult
    func `do`(
        onFailure: @escaping (Failure) -> Void = { _ in  },
        onSuccess: @escaping (Success) -> Void
    ) -> Result<Success, Failure> {
        switch self {
        case let .success(value):
            onSuccess(value)
            return .success(value)
        case let .failure(error):
            onFailure(error)
            return .failure(error)
        }
    }
    
}
