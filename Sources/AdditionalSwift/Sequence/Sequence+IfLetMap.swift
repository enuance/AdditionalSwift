//
//  Sequence+IfLetMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/12/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

extension Sequence {
    func ifLetMap<T, U>(
        _ optional: @escaping @autoclosure () -> T?
    ) -> IfLetMap<Element, T, U, [U]> {
        IfLetMap(optional) { map($0) }
    }
}
