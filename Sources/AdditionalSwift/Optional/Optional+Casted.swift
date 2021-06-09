//
//  Optional+Casted.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Optional {
    static func casted<T>(from value: T) -> Self {
        value as? Wrapped
    }
}
