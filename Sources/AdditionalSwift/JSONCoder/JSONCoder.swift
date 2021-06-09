//
//  JSONCoder.swift
//  AdditionalSwift
//
//  Created by Stephen Martinez on 4/8/21.
//  Copyright © 2021 Stephen L. Martinez. All rights reserved.
//
//  swiftlint:disable identifier_name
//

import Foundation

public enum JSON {
    public enum CodingError: Error, CustomStringConvertible {
        public typealias DecodingContext = DecodingError.Context
        public typealias EncodingContext = EncodingError.Context

        case dataCorrupted(DecodingContext)
        case keyNotFound(CodingKey, DecodingContext)
        case typeMismatch(Any.Type, DecodingContext)
        case valueNotFound(Any.Type, DecodingContext)
        case invalidValue(Any, EncodingContext)
        case stringCoding(String)
        case uncategorized(String)

        init(_ decodingError: DecodingError) {
            switch decodingError {
            case let .dataCorrupted(context):
                self = .dataCorrupted(context)
            case let .keyNotFound(codingKey, context):
                self = .keyNotFound(codingKey, context)
            case let .typeMismatch(type, context):
                self = .typeMismatch(type, context)
            case let .valueNotFound(type, context):
                self = .valueNotFound(type, context)
            @unknown default:
                self = .uncategorized("Unknown Case: \(decodingError)")
            }
        }

        init(_ encodingError: EncodingError) {
            switch encodingError {
            case let .invalidValue(anyValue, context):
                self = .invalidValue(anyValue, context)
            @unknown default:
                self = .uncategorized("Unknown Case: \(encodingError)")
            }
        }

        public var description: String {
            switch self {
            case let .dataCorrupted(decodingContext):
                return """
                JSON Decoding Error [Data Corrupted]: \
                \(decodingContext.debugDescription)
                """
            case let .keyNotFound(codingKey, decodingContext):
                return """
                JSON Decoding Error [Key Not Found]: \
                \(String(describing: codingKey)) \(decodingContext.debugDescription)
                """
            case let .typeMismatch(anyType, decodingContext):
                return """
                JSON Decoding Error [Type Mismatch]: \
                \(String(describing: anyType)) \(decodingContext.debugDescription)
                """
            case let .valueNotFound(anyType, decodingContext):
                return """
                JSON Decoding Error [Value Not Found]: \
                \(String(describing: anyType)) \(decodingContext.debugDescription)
                """
            case let .invalidValue(any, encodingContext):
                return """
                JSON Encoding Error [Invalid Value]: \
                \(String(describing: any)) \(encodingContext.debugDescription)
                """
            case let .stringCoding(string):
                return """
                JSON Coding Error [String Coding]: \
                \(string)
                """
            case let .uncategorized(string):
                return """
                JSON Coding Error [Uncategorized]: \
                \(string)
                """
            }
        }

    }

    public static func decode<T: Decodable>(
        _ type: T.Type,
        fromData data: Data,
        using decoder: JSONDecoder = JSONDecoder()
    ) -> Result<T, CodingError> {
        Result { try decoder.decode(type.self, from: data) }
            .mapError { error in DecodingError?
                .casted(from: error)
                .map(CodingError.init)
                .coalesce(.uncategorized(error.localizedDescription))
            }
    }

    public static func dataEncode<T: Encodable>(
        _ value: T,
        using encoder: JSONEncoder = JSONEncoder()
    ) -> Result<Data, CodingError> {
        do {
            let serialized = try encoder.encode(value)
            return .success(serialized)
        } catch let encodeError as EncodingError {
            return .failure(.init(encodeError))
        } catch {
            return .failure(.uncategorized(error.localizedDescription))
        }
    }

    public static func decode<T: Decodable>(
        _ type: T.Type,
        fromString string: String,
        using decoder: JSONDecoder = JSONDecoder()
    ) -> Result<T, CodingError> {
        string
            .data(using: .utf8)
            .result(.stringCoding("Failure to produce UTF8 data from \(string)"))
            .flatMap { decode(T.self, fromData: $0, using: decoder) }
    }

    public static func stringEncode<T: Encodable>(
        _ value: T,
        using encoder: JSONEncoder = JSONEncoder()
    ) -> Result<String, CodingError> {
        dataEncode(value, using: encoder)
            .map { String(data: $0, encoding: .utf8) }
            .flatMap { $0.result(.stringCoding("Failure to produce UTF8 String from data")) }
    }
}
