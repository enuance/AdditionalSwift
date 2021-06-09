//
//  Sequence+Results.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Sequence {
    func evaluated<Success, Failure: Error>(
    ) -> Result<[Success], Failure> where Element == Result<Success, Failure> {
        reduce(.success([])) { resultFromLast, nextElement in
            switch resultFromLast {
            case let .success(list):
                return nextElement.map { list + [$0] }
            case .failure:
                return resultFromLast
            }
        }
    }

    func compacted<Success, Failure: Error>(
    ) -> [Success] where Element == Result<Success, Failure> {
        compactMap { try? $0.get() }
    }

    func compactMap<NewSuccess, Failure: Error>(
        _ transform: (Element) -> Result<NewSuccess, Failure>
    ) -> [NewSuccess] {
        map(transform).compacted()
    }
}
