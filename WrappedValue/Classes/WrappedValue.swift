//
//  WrappedInt.swift
//  Freelancer
//
//  Created by Callum Trounce on 06/04/2018.
//  Copyright © 2018 DTT. All rights reserved.
//

import Foundation

public struct WrappedValue<T: Wrappable>: Codable  {
    
    public private(set) var value: T
    
    public func asWrapped() -> WrappedValue<T> {
        return self
    }
    
    public typealias RT = T
    
    public init(value: T) {
        self.value = value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var newValue: T
        do {
            newValue = try container.decode(T.self)
        } catch {
            let valueString = try container.decode(String.self)
            
            guard let value = T(valueString) else {
                throw WrappedValue.stringDecodeError(stringValue: valueString)
            }
            
            if let lastCodingKey = decoder.codingPath.last {
                print("WrappedValue found a String while trying to decode \(lastCodingKey.stringValue) to a \(T.self)")
            }
          
            newValue = value
        }
        
        self.value = newValue
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

private extension WrappedValue {
    
    /// Generates an error based on the data provided and the type of wrapped value
    ///
    /// - Parameter value: the value that was attempted to be decoded
    /// - Returns: the generated error.
    static func stringDecodeError(stringValue value: String) -> NSError {
        return NSError(
            domain: "WrappedValueErrorDomain",
            code: 1,
            userInfo: [
                NSLocalizedDescriptionKey: "The string \"\(value)\" is not parsable as an \(T.self)"
            ])
    }
}

extension WrappedValue: CustomStringConvertible {
    
    public var description: String {
        return "\(self.value)"
    }
}
