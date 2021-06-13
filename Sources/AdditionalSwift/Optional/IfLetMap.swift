//
//  IfLetMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/12/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public struct IfLetMap<Element, T, U, V> {
    private let optional: () -> T?
    private let map: ((Element) -> U) -> V

    public init(
        _ optional: @escaping () -> T?,
        map: @escaping ((Element) -> U) -> V
    ) {
        self.optional = optional
        self.map = map
    }

    public func `let` (
        _ transform: @escaping (Element, T) -> U
    ) -> ElseMap<Element, T, U, V> {
        ElseMap(optional, let: transform, map: map)
    }
}

public extension IfLetMap {
    struct ElseMap<Element, T, U, V> {
        private let optional: () -> T?
        private let letTransform: (Element, T) -> U
        private let map: ((Element) -> U) -> V

        init(
            _ optional: @escaping () -> T?,
            `let` letTransform: @escaping (Element, T) -> U,
            map: @escaping ((Element) -> U) -> V
        ) {
            self.optional = optional
            self.letTransform = letTransform
            self.map = map
        }

        public func `else`(_ transform: @escaping (Element) ->  U) -> V  {
            optional()
                .map { value in map { letTransform($0, value) } }
                .coalesce(map(transform))
        }
    }
}
