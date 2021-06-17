//
//  Result+IfLetMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/16/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

extension Result {
    func ifLetMap<Wrapped, T>(
        _ optional: @escaping @autoclosure () -> Wrapped?
    ) -> IfLetMap<Success, Wrapped, T, Result<T, Failure>> {
        IfLetMap(optional) { map($0) }
    }
}
