//
//  Expect+Networking.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 6/9/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//

#if DEBUG

import Foundation
import XCTest

public extension Expect {
    static func url(
        from urlString: String,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) throws -> URL {
        guard let url = URL(string: urlString) else {
            XCTFail("Expect.url failed", file: file, line: line)
            throw Error(info: #"Could not build URL from ("\#(urlString)")"#)
        }
        return url
    }

    static func httpResponse(
        urlString: String,
        statusCode: Int,
        httpVersion: String? = nil,
        headerFields: [String: String]? = nil,
        _ file: StaticString = #file,
        _ line: UInt = #line
    ) throws -> HTTPURLResponse {
        let httpResponse = HTTPURLResponse(
            url: try Expect.url(from: urlString, file, line),
            statusCode: statusCode,
            httpVersion: httpVersion,
            headerFields: headerFields
        )

        guard let response = httpResponse else {
            XCTFail("Expect.httpResponse failed", file: file, line: line)
            let info = "Couldn't build HTTPURLResponse from provided parameters"
            throw Error(info: info)
        }

        return response
    }
}
#endif
