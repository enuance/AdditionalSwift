//
//  Result+Bool.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension Result {
    
    /// Boolean representation
    var isSuccessful: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
}
