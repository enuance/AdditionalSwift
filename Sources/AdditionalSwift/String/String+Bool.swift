//
//  String+Bool.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

public extension String {
    
    var isBlank: Bool { allSatisfy { $0.isWhitespace } }
    
}
