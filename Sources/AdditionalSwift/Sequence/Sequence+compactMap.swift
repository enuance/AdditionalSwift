//
//  Sequence+CompactMap.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import Foundation

public extension Sequence {
    
    func compactMap<NewSuccess, Error: Swift.Error>(
        _ transform: (Element) -> Result<NewSuccess, Error>
    ) -> [NewSuccess] {
        var results: [NewSuccess] = []
        for element in self {
            if case let .success(newElement) = transform(element) {
                results.append(newElement)
            }
        }
        return results
    }
    
}
