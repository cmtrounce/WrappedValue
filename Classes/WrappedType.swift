//
//  WrappedType.swift
//  Nimble
//
//  Created by Callum Trounce on 01/11/2018.
//

import Foundation

protocol WrappedType: WrappedConvertibleType { }

protocol WrappedConvertibleType {
    associatedtype WT: Wrappable
    
    /// Converts any ResultConvertable type into a result.
    ///
    /// - Returns: result with value
    func asWrapped() -> WrappedValue<WT>
}

public typealias Wrappable = LosslessStringConvertible & Codable
