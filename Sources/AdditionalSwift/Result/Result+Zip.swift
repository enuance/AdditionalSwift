//
//  Result+Zip.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//
//  swiftlint:disable large_tuple
//

public extension Result {
    /// Zips two results together where the success is a tuple of the sucesses and failure is the first encountered
    func zip<S2>(_ secondResult: Result<S2, Failure>) -> Result<(Success, S2), Failure> {
        flatMap { first in secondResult.map { second in (first, second) } }
    }

    /// Zips three results together where the success is a tuple of the sucesses and failure is the first encountered
    func zip<S2, S3>(
        _ secondResult: Result<S2, Failure>,
        _ thirdResult: Result<S3, Failure>
    ) -> Result<(Success, S2, S3), Failure> {
        flatMap { first in secondResult
            .zip(thirdResult)
            .map { (first, $0, $1) }
        }
    }

    /// Zips four results together where the success is a tuple of the sucesses and failure is the first encountered
    func zip<S2, S3, S4>(
        _ secondResult: Result<S2, Failure>,
        _ thirdResult: Result<S3, Failure>,
        _ fourthResult: Result<S4, Failure>
    ) -> Result<(Success, S2, S3, S4), Failure> {
        flatMap { first in secondResult
            .zip(thirdResult, fourthResult)
            .map { (first, $0, $1, $2) }
        }
    }

    /// Zips five results together where the success is a tuple of the sucesses and failure is the first encountered
    func zip<S2, S3, S4, S5>(
        _ secondResult: Result<S2, Failure>,
        _ thirdResult: Result<S3, Failure>,
        _ fourthResult: Result<S4, Failure>,
        _ fifthResult: Result<S5, Failure>
    ) -> Result<(Success, S2, S3, S4, S5), Failure> {
        flatMap { first in secondResult
            .zip(thirdResult, fourthResult, fifthResult)
            .map { (first, $0, $1, $2, $3) }
        }
    }

    /// Zips six results together where the success is a tuple of the sucesses and failure is the first encountered
    func zip<S2, S3, S4, S5, S6>(
        _ secondResult: Result<S2, Failure>,
        _ thirdResult: Result<S3, Failure>,
        _ fourthResult: Result<S4, Failure>,
        _ fifthResult: Result<S5, Failure>,
        _ sixthResult: Result<S6, Failure>
    ) -> Result<(Success, S2, S3, S4, S5, S6), Failure> {
        flatMap { first in secondResult
            .zip(thirdResult, fourthResult, fifthResult, sixthResult)
            .map { (first, $0, $1, $2, $3, $4) }
        }
    }
}
