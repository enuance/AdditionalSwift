//
//  Expect.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/9/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG
public enum Expect { }

public extension Expect {
    struct Error: Swift.Error {
        public let info: String

        public init(info: String) {
            self.info = info
        }
    }
}
#endif
