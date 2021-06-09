//
//  String+Occurances.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/13/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

import Foundation

public extension String {
    static func occurances(ofRegex regex: String, `in` string: String) -> [String] {
        #if DEBUG
        let isValid = (try? NSRegularExpression(pattern: regex, options: [])) != nil
        assert(isValid, "Invalid Regex Pattern: \(regex)")
        #endif

        var searchString = string
        var foundMatches: [String] = []

        var nextMatchFound: Range<String.Index>? {
            searchString.range(of: regex, options: .regularExpression)
        }

        func newSearch(string: String, removing range: Range<String.Index>) -> String {
            var newString = string
            let removingRange = string.startIndex..<range.upperBound
            newString.removeSubrange(removingRange)
            return newString
        }

        while let matchRange = nextMatchFound {
            let newMatch = String(searchString[matchRange])
            foundMatches.append(newMatch)
            searchString = newSearch(string: searchString, removing: matchRange)
        }

        return foundMatches
    }

    func occurances(ofRegex pattern: String) -> [String] {
        Self.occurances(ofRegex: pattern, in: self)
    }
}
