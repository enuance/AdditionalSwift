//
//  IfLetMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/12/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public struct IfLetMap<Element, Wrapped, T, Container> {
    private let optional: () -> Wrapped?
    private let map: ((Element) -> T) -> Container

    public init(
        _ optional: @escaping () -> Wrapped?,
        map: @escaping ((Element) -> T) -> Container
    ) {
        self.optional = optional
        self.map = map
    }

    public func `let` (
        _ transform: @escaping (Element, Wrapped) -> T
    ) -> ElseMap<Element, Wrapped, T, Container> {
        ElseMap(optional, let: transform, map: map)
    }
}

public extension IfLetMap {
    struct ElseMap<Element, Wrapped, T, Container> {
        private let optional: () -> Wrapped?
        private let letTransform: (Element, Wrapped) -> T
        private let map: ((Element) -> T) -> Container

        init(
            _ optional: @escaping () -> Wrapped?,
            `let` letTransform: @escaping (Element, Wrapped) -> T,
            map: @escaping ((Element) -> T) -> Container
        ) {
            self.optional = optional
            self.letTransform = letTransform
            self.map = map
        }

        public func `else`(_ transform: @escaping (Element) -> T) -> Container {
            optional()
                .map { value in map { letTransform($0, value) } }
                .coalesce(map(transform))
        }
    }
}
