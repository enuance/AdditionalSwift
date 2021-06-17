//
//  Sequence+IfLetMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/12/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

extension Sequence {
    func ifLetMap<Wrapped, T>(
        _ optional: @escaping @autoclosure () -> Wrapped?
    ) -> IfLetMap<Element, Wrapped, T, [T]> {
        IfLetMap(optional) { map($0) }
    }
}
