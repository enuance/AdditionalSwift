//
//  Result+Transform.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Result {
    /// Swaps the existing `Success` value with the provided `NewSuccess` value.
    func transform<NewSuccess>(to newSuccess: NewSuccess) -> Result<NewSuccess, Failure> {
        switch self {
        case .success:
            return .success(newSuccess)
        case let .failure(error):
            return .failure(error)
        }
    }

    /// Swaps the existing `Success` value with a `Void` value.
    func transform() -> Result<Void, Failure> {
        switch self {
        case .success:
            return .success(())
        case let .failure(error):
            return .failure(error)
        }
    }
}
