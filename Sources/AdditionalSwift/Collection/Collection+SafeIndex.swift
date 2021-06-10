//
//  Collection+SafeIndex.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
